# frozen_string_literal: true

# gem 'rubocop', require: false

# frozen_string_literal: true

class CaesarCipher
  attr_accessor :user_input, :shift

  def initialize
    @user_input = nil
    @shift = nil
  end

  def valid_string?(user_input)
    !user_input.empty? && user_input.chars.all? { |letter| letter.match?(/[a-zA-Z ]/) }
  end

  def valid_shift?(user_input)
    user_input.chars.all? { |char| char.match?(/[0-9]/) } && user_input.to_i.positive? && user_input.to_i <= 25
  end

  def caesar_cipher(letter, shift_amount)
    caesar_array = []
    alphabet = ('a'..'z').to_a
    uppercase_alphabet = ('A'..'Z').to_a

    letter.chars.each do |char|
      if char.match?(/[a-z]/)
        index = alphabet.index(char)
        shifted_index = (index + shift_amount) % 26
        caesar_array << alphabet[shifted_index]
      elsif char.match?(/[A-Z]/)
        index = uppercase_alphabet.index(char)
        shifted_index = (index + shift_amount) % 26
        caesar_array << uppercase_alphabet[shifted_index]
      else
        caesar_array << char # letzte Option: Leerzeichen
      end
    end
    caesar_array.join
  end

  def start
    user_input
    choose_shift
    encrypted_sentence
  end

  def user_input
    # Wort/Satz eingeben & checken
    puts 'Please enter a word or sentence to encrypt: '
    string = gets.chomp

    until valid_string?(string)
      puts 'Your input is invalid. Please only enter letters.'
      string = gets.chomp
    end
    @user_input = string
  end

  def choose_shift
    # Verschiebung eingeben & checken
    puts 'Please enter by how many positions in the alphabet the input should be shifted (1-25): '
    shift = gets.chomp

    until valid_shift?(shift)
      puts 'Your input is invalid. Please only enter numbers between 1-25.'
      shift = gets.chomp
    end
    @shift = shift
  end

  private

  def encrypted_sentence
    # Ergebnis ausgeben
    puts "All done! Here comes your Caesar cipher: #{caesar_cipher(@user_input, @shift.to_i)}"
  end
end
