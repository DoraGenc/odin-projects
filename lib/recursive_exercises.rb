class RecursiveMethods
  
  def is_palindrome?(input_string)

    unless input_string.is_a?(String)
      return false
    end

    if input_string.length == 1 || input_string.length == 0
      true
    else
      if input_string[0] == input_string[-1]
        is_palindrome?(input_string[1..-2])
      else
        false
      end
    end
  end

  def bottles_of_beer(number_of_bottles)

    if number_of_bottles <= 0 || !(number_of_bottles.is_a?(Integer))
      puts "No more bottles of beer on the wall. :("
    else
      puts "#{number_of_bottles} bottles of beer on the wall"
      bottles_of_beer(number_of_bottles - 1)
    end
  end
end
