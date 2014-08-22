#!/usr/bin/env ruby -wKU
=begin
  Name: 2e_spec_change.rb
  Description: Shapes Changed Spec
  Author: Arvinder Kang
  Date: 2014-08-21
  Licensed under the MIT license
=end

class Shape
  def initialize(shape, sound)
    @shape = shape
    @sound = sound
  end

  def click
    "#{@shape} clicks by 360 degrees"
  end

  def play
    "Playing #{@sound}.aif"
  end
end

class Square < Shape; end
class Circle < Shape; end
class Triangle < Shape; end

class Amoeba < Shape
  def click
    "#{@shape} clicks around one end."
  end

  def play
    "Playing #{@sound}.hif"
  end
end

s = Square.new("square", "Banjo!")
c = Circle.new("circle", "Moo!")
t = Triangle.new("triangle", 'Violen!')
a = Amoeba.new("ameoba", 'Nom Nom Nom!')

puts s.click
puts s.play
puts c.click
puts c.play
puts t.click
puts t.play

puts a.click
puts a.play
