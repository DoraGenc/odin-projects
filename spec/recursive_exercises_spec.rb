require_relative '../lib/recursive_exercises'

RSpec.describe RecursiveMethods do
  subject(:instance) { described_class.new }

  describe "#is_palindrome?" do

    context "when the input is a palindrome" do
      it "returns true" do
        palindrome = "anna"
        expect(instance.is_palindrome?(palindrome)).to eq(true)
      end
    end

    context "when giving it a single input" do
      it "returns true" do
        palindrome = "a"
        expect(instance.is_palindrome?(palindrome)).to eq(true)
      end
    end

    context "when the input is not a palindrome" do
      it "returns false" do
        no_palindrome = "word"
        expect(instance.is_palindrome?(no_palindrome)).to eq(false)
      end
    end

    context "when the input is anything other than a string" do
      it "returns false" do
        no_palindrome = 1
        expect(instance.is_palindrome?(no_palindrome)).to eq(false)
      end
    end

    context "when the input is not a coherent word" do
      it "returns true if it is a palindrome" do
        incoherent_valid_palindrome = "regal lager"
        expect(instance.is_palindrome?(incoherent_valid_palindrome)).to eq(true)
      end

      it "returns false if it isn't a palindrome" do
        incoherent_invalid_palindrome = "raspberry cheesecake"
        expect(instance.is_palindrome?(incoherent_invalid_palindrome)).to eq(false)
      end
    end


  end
end