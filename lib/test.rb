# frozen_string_literal: true

class Animal
  def speak
    'Hello!'
  end
end

class GoodDog < Animal
  attr_accessor :name

  def initialize(n)
    n
  end

  def speak
    "#{name} says arf!"
  end
end

class Cat < Animal
end

sparky = GoodDog.new('Sparky')
paws = Cat.new

puts sparky.speak # => Sparky says arf!
puts paws.speak
