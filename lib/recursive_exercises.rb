class RecursiveMethods
  
  def is_palindrome?(input_string)

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
end
