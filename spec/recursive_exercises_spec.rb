require_relative '../lib/recursive_exercises'

RSpec.describe RecursiveMethods do
  subject(:recursive_method) { described_class.new }

  describe "#is_palindrome?" do

    context "when the input is a palindrome" do
      it "returns true" do
        palindrome = "anna"
        expect(recursive_method.is_palindrome?(palindrome)).to eq(true)
      end
    end

    context "when giving it a single input" do
      it "returns true" do
        palindrome = "a"
        expect(recursive_method.is_palindrome?(palindrome)).to eq(true)
      end
    end

    context "when the input is not a palindrome" do
      it "returns false" do
        no_palindrome = "word"
        expect(recursive_method.is_palindrome?(no_palindrome)).to eq(false)
      end
    end

    context "when the input is anything other than a string" do
      it "returns false" do
        no_palindrome = 1
        expect(recursive_method.is_palindrome?(no_palindrome)).to eq(false)
      end
    end

    context "when the input is not a coherent word" do
      it "returns true if it is a palindrome" do
        incoherent_valid_palindrome = "regal lager"
        expect(recursive_method.is_palindrome?(incoherent_valid_palindrome)).to eq(true)
      end

      it "returns false if it isn't a palindrome" do
        incoherent_invalid_palindrome = "raspberry cheesecake"
        expect(recursive_method.is_palindrome?(incoherent_invalid_palindrome)).to eq(false)
      end
    end
  end

  describe "#bottles_of_beer" do

    before do
      allow(recursive_method).to receive(:bottles_of_beer).and_call_original
    end
    
    context "when taking a positive integer as the argument" do
      it "outputs to stdout" do
        number_of_bottles = 3
        expect{ recursive_method.bottles_of_beer(number_of_bottles) }.to output.to_stdout
      end

      it 'outputs to stdout exactly as many times as the argument specifies' do
        number_of_bottles = 3
        recursive_method.bottles_of_beer(number_of_bottles)
        expect(recursive_method).to have_received(:bottles_of_beer).exactly(4).times
      end
    end

    context "when taking anything other than an integer as the argument" do
      it "only calls #bottles_of_beer once" do
        float = 3.14
        recursive_method.bottles_of_beer(float)
        expect(recursive_method).to have_received(:bottles_of_beer).once
      end
    end

    context "when taking a negative integer as the argument" do
      it "only calls #bottles_of_beer once" do
        negative_integer = -2
        recursive_method.bottles_of_beer(negative_integer)
        expect(recursive_method).to have_received(:bottles_of_beer).once
      end
    end
  end

  describe "#fibonacci" do
    context "when taking a positive integer as the argument" do
      it "returns the correct fibonacci number" do
        positive_integer = 6
        fibo_num = 8
        expect(recursive_method.fibonacci(positive_integer)).to eq(fibo_num)
      end
    end

    context "when taking anything other than an integer" do
      it "returns 0" do
        float = 6.0
        expect(recursive_method.fibonacci(float)).to eq(0)
      end
    end

    context "when taking a negative integer as the argument" do
      it "returns 0" do
        negative_integer = -6
        expect(recursive_method.fibonacci(negative_integer)).to eq(0)
      end
    end

    context "when the input is 1" do
      it "returns 1" do
        expect(recursive_method.fibonacci(1)).to eq(1)
      end
    end

    context "when the input is 0" do
      it "returns 0" do
        expect(recursive_method.fibonacci(0)).to eq(0)
      end
    end
  end
end