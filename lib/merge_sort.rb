
class MergeSort

  def merge_sort(unsorted_array)

    unless unsorted_array.is_a?(Array) && unsorted_array.flatten.all? { |element| element.is_a?(Integer) || element.is_a?(Float)}
      return "Invalid input. Please only enter in arrays that consist of floats or integers."
    end

    unsorted_array = unsorted_array.flatten

    if unsorted_array.length <= 1
      return unsorted_array
    end
    
    mid = unsorted_array.length / 2

    left = merge_sort(unsorted_array[0...mid]) #range, um mid selbst auszuschließen
    right = merge_sort(unsorted_array[mid..-1])

    merge(left, right)
  end

  def merge(left, right)

    sorted_array = []

    while !left.empty? && !right.empty?
      if left.first <= right.first
        sorted_array << left.shift
      else
        sorted_array << right.shift
      end
    end

    sorted_array.concat(left)
    sorted_array.concat(right)

    return sorted_array
  end
end