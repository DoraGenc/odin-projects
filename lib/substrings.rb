# frozen_string_literal: true

# dictionary als Konstante

def substrings(user_input)
  dictionary = %w[
    apple banana orange grape fruit eat eatery
    hello world how are you going to the party
    good bad happy sad joy love friend family
    book read write author story novel library
    computer program code debug software hardware
    python ruby javascript html css web development
    car bus train plane travel journey ride vehicle
    city town village street road park place location
    mountain river sea ocean lake forest desert nature
    and it is a in of with on for at by from that this has had will be was were
  ]

  words_array = user_input.downcase.split(' ')
  result_hash_pairs = Hash.new(0) # mit Standartwert 0

  words_array.each do |word|
    if dictionary.include?(word)
      result_hash_pairs[word] += 1
    else
      puts "\"#{word}\" is not included in the dictionary."
    end
  end

  result_hash_pairs
end

puts 'To find matching words, please enter a sentence below: '
user_sentence = gets.chomp

puts substrings(user_sentence)
