# frozen_string_literal: true

# Create an object

class Frechdachs
  attr_accessor :name, :fluffiness, :weight

  def initialize(name, fluffiness, weight)
    self.name = name
    self.fluffiness = fluffiness
    self.weight = weight
  end

  def speak
    "#{name} + says eek!!"
  end

  def info
    puts "#{name} weighs #{weight}kg and is #{fluffiness}/10 fluffy!!"
  end
end

dachs = Frechdachs.new('Dachs', '8', '12')
puts dachs.speak
puts dachs.info
