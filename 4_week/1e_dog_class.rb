#!/usr/bin/env ruby -wKU
=begin
  Name: 1e_dog_class.rb
  Description: Class Dog
  Author: Arvinder Kang
  Date: 2014-08-14
  Licensed under the MIT license
=end

class Dog
  def initialize(name="Scooby")
    @name = name
  end

  def bark
    "barks"
  end

  def eat
    "eats"
  end

  def chase_cat
    "chases cat"
  end

  def to_s
    @name
  end
end

d = Dog.new("Leo")
puts d
puts "#{d} #{d.bark}"
puts "#{d} #{d.eat}"
puts "#{d} #{d.chase_cat}"
