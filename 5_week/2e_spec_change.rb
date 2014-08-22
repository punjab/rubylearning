#!/usr/bin/env ruby -wKU
=begin
  Name: 2e_spec_change.rb
  Description: Shapes
  Author: Arvinder Kang
  Date: 2014-08-21
  Licensed under the MIT license
=end

class Shape
  def initialize(shape, sound)
    @shape = shape
    @sound = sound
  end

  def rotate
    "#{@shape} rotates by 360 degrees"
  end

  def play
    "Playing #{@sound}"
  end
end

class Square < Shape; end
class Circle < Shape; end
class Triangle < Shape; end

s = Square.new("square", "Banjo!")
c = Circle.new("circle", "Moo!")
t = Triangle.new("triangle", 'Violen!')

puts s.rotate
puts s.play
puts c.rotate
puts c.play
puts t.rotate
puts t.play
