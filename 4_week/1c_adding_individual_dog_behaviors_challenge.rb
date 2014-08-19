#!/usr/bin/env ruby -wKU
=begin
  Name: 1c_adding_individual_dog_behaviors_challenge.rb
  Description: Dog class extended behaviour
  Author: Arvinder Kang
  Date: 2014-08-18
  Licensed under the MIT license
=end
=begin
  doctest: Initialize a dog named Billy
  >> a = Dog.new("Fido")
  >> a.to_s
  => "Fido"
  doctest: Teach Billy how to sing
  >> a.teach_trick(:sing) {"#{@name} sings!"}
  >> a.sing
  => "Fido sings!"
  doctest: Test a trick dog does not know
  >> error = begin; a.kick; rescue NoMethodError => e; e; end
  >> error.class
  => NoMethodError
  doctest: Directly call count_trick
  >> a.count_trick {"#{@name} counts!"}
  >> a.count
  => "Fido counts!"
  doctest: A method without _trick in the end should give method missing
  >> error = begin; a.reverse; rescue NoMethodError => e; e; end
  >> error.class
  => NoMethodError
=end

class Dog
  def initialize(name="Dido")
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
    if trick =~ /(.*)_trick$/
      puts "#{self} does not know how to #{trick}!  We can and will teach him if you provide a block"
      return teach_trick($1, &block) if block_given?
    else
      super
    end
  end
end

d = Dog.new('Lassie')
d.teach_trick(:dance) { "#{@name} is dancing!" }
puts d.dance
d.teach_trick(:poo) { "#{@name} is a smelly doggy!" }
puts d.poo
d2 = Dog.new('Fido')
# puts d2.dance
d2.teach_trick(:laugh) { "#{@name} finds this hilarious!" }
d2.roll_over_trick{ "#{@name} rolls over!" }
puts d2.laugh
puts d2.roll_over
# puts d.laugh
d3 = Dog.new('Stimpy')
puts d3
# puts d3.laugh
