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

  def rotate
    "#{@shape} clicks by 360 degrees"
  end

  def play
    "Playing #{@sound}.aif"
  end

  def click
    [rotate, play].join("\n")
  end
end

class Square < Shape; end
class Circle < Shape; end
class Triangle < Shape; end

class Amoeba < Shape
  def rotate
    "#{@shape} clicks around one end."
  end

  def play
    "Playing #{@sound}.hif"
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
