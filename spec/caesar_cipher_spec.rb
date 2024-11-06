require_relative '../scr/caesar_cipher'

RSpec.describe CaesarCipher do
  subject(:cipher) { described_class.new }

  describe '#valid_string?' do
    context 'when the user enters input' do
      it 'does not accept empty input' do
        invalid_input = ''
        expect(cipher.valid_string?(invalid_input)).to be false
      end

      it 'does not accept numbers' do
        invalid_input = '1'
        expect(cipher.valid_string?(invalid_input)).to be false
      end

      it 'does not accept symbols' do
        invalid_input = ','
        expect(cipher.valid_string?(invalid_input)).to be false
      end

      it 'only accepts matching chars (only letters from a to z)' do
        valid_input = 'hello'
        expect(cipher.valid_string?(valid_input)).to be true
      end
    end
  end

  describe '#valid_shift?' do
    context 'when the user enters input' do
      it 'does not accept anything other than numbers' do
        invalid_input = 'a/!'
        expect(cipher.valid_shift?(invalid_input)).to be false
      end

      it 'does not accepts floats' do
        invalid_input = '10.1'
        expect(cipher.valid_shift?(invalid_input)).to be false
      end

      it 'does not accept negative numbers' do
        invalid_input = '-10'
        expect(cipher.valid_shift?(invalid_input)).to be false
      end

      it 'does not accept numbers between 0 and 25' do
        invalid_input = '27'
        expect(cipher.valid_shift?(invalid_input)).to be false
      end

      it 'accepts numbers between 0 and 25' do
        valid_input = '11'
        expect(cipher.valid_shift?(valid_input)).to be true
      end

      it 'does not accept integers' do
        invalid_input = 5

        expect { cipher.valid_shift?(invalid_input) }.to raise_error
      end
    end
  end

  describe '#caesar_cipher' do # nimmt letter & shift amount an
    context 'when giving caesar_cipher a string and a shift amount' do
      it 'can start again at the beginning of the alphabet' do
        input = 'z'
        shift = 1

        expect(cipher.caesar_cipher(input, shift)).to eql('a')
      end

      it 'can do a small shift' do
        input = 'hello'
        shift = 2

        expect(cipher.caesar_cipher(input, shift)).to eql('jgnnq')
      end

      it 'can do a big shift' do
        input = 'hello'
        shift = 13

        expect(cipher.caesar_cipher(input, shift)).to eql('uryyb')
      end

      it 'leaves spaces' do
        input = 'hello world'
        shift = 2

        expect(cipher.caesar_cipher(input, shift)).to eql('jgnnq yqtnf')
      end

      it 'can output uppercase and lowercase letters' do
        input = 'Hello World'
        shift = 2

        expect(cipher.caesar_cipher(input, shift)).to eql('Jgnnq Yqtnf')
      end
    end
  end

  describe '#start' do
    context 'when calling start' do
      before do
        allow(cipher).to receive(:user_input)
        allow(cipher).to receive(:choose_shift)
        allow(cipher).to receive(:encrypted_sentence)
      end

      it 'calls user_input' do
        expect(cipher).to receive(:user_input)
        cipher.start
      end

      it 'calls choose_shift' do
        expect(cipher).to receive(:choose_shift)
        cipher.start
      end

      it 'calls encrypted_sentence' do
        expect(cipher).to receive(:encrypted_sentence)
        cipher.start
      end
    end
  end

  describe '#user_input' do
    context 'when the user enters something valid to encrypt' do
      it 'updates @user_input from nil to input' do
        input = 'hello'
        allow(cipher).to receive(:gets).and_return(input)
        expect(cipher.user_input).not_to be_nil
      end

      it 'chomps Enter' do # funktioniert nicht
        input = "hello\n"
        allow(cipher).to receive(:gets).and_return(input)
        expect(cipher.user_input).to eql('hello')
      end

      it 'calls valid_string? and asks if the input is valid' do
        input = 'hello'

        allow(cipher).to receive(:gets).and_return(input)
        allow(cipher).to receive(:valid_string?).and_return true

        cipher.user_input
        expect(cipher).to have_received(:valid_string?).once
      end
    end

    context 'when the user enters something invalid to encrypt' do
      it 'asks the user to enter something until it is valid' do
        invalid_input = 'h3llo'
        valid_input = 'hello'

        allow(cipher).to receive(:gets).and_return(invalid_input, valid_input) # stubbed user input
        allow(cipher).to receive(:valid_string?).and_return(false, true)

        cipher.user_input
        expect(cipher).to have_received(:gets).twice
      end

      it 'asks the user to enter something valid when entering something invalid two times' do
        invalid_input = '3'
        valid_input = 'hello'

        allow(cipher).to receive(:gets).and_return(invalid_input, invalid_input, valid_input) # stubbed user input
        allow(cipher).to receive(:valid_string?).and_return(false, false, true)

        cipher.user_input
        expect(cipher).to have_received(:gets).exactly(3).times
      end
    end
  end

  describe '#choose_shift' do
    context 'when the user enters a valid shift amount' do
      it 'updates @shift from nil to input' do
        input = '1'

        allow(cipher).to receive(:gets).and_return(input)
        cipher.choose_shift
        expect(cipher.shift).not_to be_nil
      end

      it 'chomps Enter' do
        input = "3\n"

        allow(cipher).to receive(:gets).and_return(input)
        cipher.choose_shift
        expect(cipher.shift).to eql('3')
      end

      it 'calls valid_shift? and asks if the input is valid' do
        input = '2'

        allow(cipher).to receive(:gets).and_return(input)
        allow(cipher).to receive(:valid_shift?).and_return true

        cipher.choose_shift
        expect(cipher).to have_received(:valid_shift?).once
      end
    end

    context 'when the user enters an invalid shift amount' do
      it 'asks the user to enter something until it is valid' do
        invalid_input = 'a'
        valid_input = '1'

        allow(cipher).to receive(:gets).and_return(invalid_input, valid_input) # stubbed user input

        cipher.choose_shift
        expect(cipher).to have_received(:gets).twice
      end

      it 'asks the user to enter something valid when entering something invalid two times' do
        invalid_input = 'a'
        valid_input = '1'

        allow(cipher).to receive(:gets).and_return(invalid_input, invalid_input, valid_input) # stubbed user input

        cipher.choose_shift
        expect(cipher).to have_received(:gets).exactly(3).times
      end
    end
  end
  # encrypted_sentence is private & a puts method => well tested (ruby standard library)
end
