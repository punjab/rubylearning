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
    @direction = 'by 360 degrees'
    @extension = 'aif'
  end

  def rotate
    "#{@shape} rotates #{@direction}"
  end

  def play
    "Playing #{@sound}.#{@extension}"
  end

  def click
    [rotate, play].join("\n")
  end
end

class Square < Shape; end
class Circle < Shape; end
class Triangle < Shape; end

class Amoeba < Shape
  def initialize(*args)
    super
    @direction = 'around a point on one end.'
    @extension = 'hif'
  end
end

[
  Square.new("square", "Banjo!"),
  Circle.new("circle", "Moo!"),
  Triangle.new("triangle", 'Violen!'),
  Amoeba.new("ameoba", 'Nom Nom Nom!')
].each do |shape|
  puts shape.click
end
