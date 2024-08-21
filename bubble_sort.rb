
def bubble_sort!(user_input)

  swap = true
  iterations = user_input.length # iterations = die Anzahl der Elemente im Array (5)

  while swap
  
    swap = false
    iterations -= 1

    iterations.times do |index| 
      
      if user_input[index] > user_input[index + 1]
        user_input[index], user_input[index + 1] = user_input[index + 1], user_input[index] # = ist eine Zuweisung, also links wird der rechte Index zugewiesen
        swap = true #wenn IRGENDEIN swap passiert ist, also if zutraf, dann bleibt swap 0
      end

    end

  end
  user_input
end




user_numbers_array = Array.new

5.times do
puts "In the following, an array will be created with 5 numbers. Please enter the numbers you want to enter one after another: "

each_user_number = gets.chomp.to_i
user_numbers_array << each_user_number
end

puts bubble_sort!(user_numbers_array).inspect


