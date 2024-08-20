
# Methoden, die checken, ob eine Eingabe valid ist:

caesar_array = Array.new

def valid_string?(user_input)
  !user_input.empty? && user_input.chars.all? { |letter| letter.match?(/[a-zA-Z ]/) }
end


def valid_shift?(user_input)
  user_input.chars.all? { |char| char.match?(/[0-9]/) } && user_input.to_i > 0 && user_input.to_i <= 25
end


# caesar_cipher Methode:

def caesar_cipher(letter, shift_amount)

  caesar_array = []
  alphabet = ("a".."z").to_a
  uppercase_alphabet = ("A".."Z").to_a


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



# Wort/Satz eingeben & checken

puts "Please enter a word or sentence to encrypt: "
string = gets.chomp


while !valid_string?(string)
  
    puts "Your input is invalid. Please only enter letters."
    puts "Please enter something valid to encrypt: "
    
    string = gets.chomp
end



# Verschiebung eingeben & checken

puts "Please enter by how many positions in the alphabet the input should be shifted (1-25): "
shift = gets.chomp


while !valid_shift?(shift)
 
    puts "Your input is invalid. Please only enter numbers between 1-25."
    puts "Please enter something valid to encrypt: "
    
    shift = gets.chomp
end




# Ergebnis ausgeben

puts "All done! Here comes your Caesar cipher: #{caesar_cipher(string, shift.to_i)}" 
