require_relative '../lib/recursive_exercises'

RSpec.describe RecursiveMethods do
  subject(:method) { described_class.new }

  describe "#is_palindrome?" do
    context "when the input is a palindrome" do
      
      it "returns true" do
        palindrome = "anna"
        expect(is_palindrome?(palindrome)).to return(true)
      end
    end
  end
end