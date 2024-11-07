# frozen_string_literal: true

class RecursiveMethods
  def initialize
    @roman_mapping = {
      1000 => 'M',
      900 => 'CM',
      500 => 'D',
      400 => 'CD',
      100 => 'C',
      90 => 'XC',
      50 => 'L',
      40 => 'XL',
      10 => 'X',
      9 => 'IX',
      5 => 'V',
      4 => 'IV',
      1 => 'I'
    }
  end

  def is_palindrome?(input_string)
    return false unless input_string.is_a?(String)

    return true if input_string.length == 1 || input_string.empty?

    if input_string[0] == input_string[-1]
      is_palindrome?(input_string[1..-2])
    else
      false
    end
  end

  def bottles_of_beer(number_of_bottles)
    if number_of_bottles <= 0 || !number_of_bottles.is_a?(Integer)
      puts 'No more bottles of beer on the wall. :('
    else
      puts "#{number_of_bottles} bottles of beer on the wall"
      bottles_of_beer(number_of_bottles - 1)
    end
  end

  def fibonacci(num)
    return 0 unless num.is_a?(Integer) && num >= 0

    if num.zero?
      0

    elsif num == 1
      1
    else
      fibonacci(num - 1) + fibonacci(num - 2)
    end
  end

  # case

  def flatten(input)
    return [] if input.empty?
    return 'Invalid input. Please only enter in arrays.' unless input.is_a?(Array)

    if input[0].is_a?(Array)
      flatten(input[0]) + flatten(input[1..])
    else
      [input[0]] + flatten(input[1..])
    end
  end

  def int_to_roman(num, result = '')
    if num.is_a?(Integer) && num > -1 && num < 4000

      return result if num.zero?

      roman_mapping.each_key do |divisor|
        quotient = num / divisor # wie oft passt der divisor in die num
        modulus = num % divisor # was ist der rest dabei

        if quotient.positive?
          result << roman_mapping[divisor] * quotient # so oft das zeichen in result, wie es reinpasst
          return int_to_roman(modulus, result)
        end
      end
    else
      'Invalid Input. Please only enter in positive integers up to 3999.'
    end
  end

  def roman_to_int(roman_num, result = 0)
    if roman_num[0..3] != 'MMMM' && roman_num.is_a?(String)
      return result if roman_num.empty?

      roman_mapping.each do |key, value|
        if roman_num[0, value.length] == value # weil z.B. IV 2 Stellen lang ist
          result += key
          return roman_to_int(roman_num[value.length..], result)
        end
      end
    else
      'Invalid Input. Please only enter in positive integers up to 3999.'
    end
  end

  private

  attr_reader :roman_mapping
end
