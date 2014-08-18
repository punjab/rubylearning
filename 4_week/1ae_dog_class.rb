#!/usr/bin/env ruby -wKU
=begin
  Name: 1ae_dog_class.rb
  Description: Dog Class Extended
  Author: Arvinder Kang
  Date: 2014-08-15
  Licensed under the MIT license
=end

=begin
  doctest: Initialize a dog named Billy
  >> a = Dog.new("Billy")
  >> a.to_s
  => "Billy"
  doctest: Teach Billy how to sing
  >> a.teach_trick(:sing) {"#{@name} sings!"}
  >> a.sing
  => "Billy sings!"
  doctest: Test a trick dog does not know
  >> a.kick
  => "Billy does not know how to kick!"
  doctest: Directly call count_trick
  >> a.count_trick {"#{@name} counts!"}
  >> a.count
  => "Billy counts!"
  doctest: A method without _trick in the end should give method missing
  >> a.reverse
  => "Billy does not know how to reverse!"
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

  def teach_trick(trick, &block)
    self.send(:define_singleton_method, trick, &block)
  end

  def method_missing(trick, *args, &block)
    return teach_trick($1, &block) if trick =~ /(.*)_trick$/
    "#{self} does not know how to #{trick}!"
  end
end

d = Dog.new('Lassie')
d.teach_trick(:dance) { "#{@name} is dancing!" }
puts d.dance
d.teach_trick(:poo) { "#{@name} is a smelly doggy!" }
puts d.poo
d2 = Dog.new('Fido')
puts d2.dance
d2.teach_trick(:laugh) { "#{@name} finds this hilarious!" }
d2.roll_over_trick{ "#{@name} finds this hilarious!" }
puts d2.laugh
puts d.laugh
d3 = Dog.new('Stimpy')
puts d3.dance
puts d3.laugh
