#!/usr/bin/env ruby -wKU
=begin
  Name: 2e_spec_change.rb
  Description: Shapes Changed Spec
  Author: Arvinder Kang
  Date: 2014-08-21
  Licensed under the MIT license
=end

class Shape
  def initialize(shape = nil, sound = nil, direction = 'by 360 degrees', extension = 'aif')
    @shape ||= self.class.name
    @sound ||= self.class.name
    @direction = direction
    @extension = extension
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
class Amoeba < Shape; end

[
  Square.new("square", "Banjo!"),
  Circle.new,
  Triangle.new("triangle", 'Violen!'),
  Amoeba.new("ameoba", 'Nom Nom Nom!', 'around a point on one end.','hif')
].each do |shape|
  puts shape.click
end
