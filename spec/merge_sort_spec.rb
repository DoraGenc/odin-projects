# frozen_string_literal: true

require_relative '../lib/merge_sort'

RSpec.describe MergeSort do
  subject(:mergesort) { described_class.new }

  describe '#merge_sort' do
    context 'when the array consists of 4 positive integers' do
      it 'sorts it correctly' do
        unsorted_array = [2, 5, 10, 1]
        sorted_array = [1, 2, 5, 10]
        expect(mergesort.merge_sort(unsorted_array)).to eq(sorted_array)
      end
    end

    context 'when the array consists of an odd number of integers' do
      it 'sorts it correctly' do
        unsorted_array = [2, 5, 10, 1, 7]
        sorted_array = [1, 2, 5, 7, 10]
        expect(mergesort.merge_sort(unsorted_array)).to eq(sorted_array)
      end
    end

    context 'when the array consists of negative integers' do
      it 'sorts it correctly' do
        unsorted_array = [-2, -5, -10, -1, -7]
        sorted_array = [-10, -7, -5, -2, -1]
        expect(mergesort.merge_sort(unsorted_array)).to eq(sorted_array)
      end
    end

    context 'when the array consists of floats' do
      it 'sorts it correctly' do
        unsorted_array = [1.2, 1.5, 1.1]
        sorted_array = [1.1, 1.2, 1.5]
        expect(mergesort.merge_sort(unsorted_array)).to eq(sorted_array)
      end
    end

    context 'when the input consists of anything other than integers or floats' do
      it 'returns an error' do
        invalid_input = 'invalid'
        error = 'Invalid input. Please only enter in arrays that consist of floats or integers.'
        expect(mergesort.merge_sort(invalid_input)).to eq(error)
      end
    end

    context 'when the input consists of nested arrays' do
      it 'sorts it correctly' do
        unsorted_array = [[1], [9, 8], [10], 6]
        sorted_array = [1, 6, 8, 9, 10]
        expect(mergesort.merge_sort(unsorted_array)).to eq(sorted_array)
      end
    end
  end
end
