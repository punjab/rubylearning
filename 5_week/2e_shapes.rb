#!/usr/bin/env ruby -wKU
=begin
  Name: 2e_shapes.rb
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

  def click
    [rotate, play].join("\n")
  end
end

class Square < Shape; end
class Circle < Shape; end
class Triangle < Shape; end

[
  Square.new("square", "Banjo!"),
  Circle.new("circle", "Moo!"),
  Triangle.new("triangle", 'Violen!')
].each do |shape|
  puts shape.click
end
