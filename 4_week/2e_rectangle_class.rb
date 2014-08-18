#!/usr/bin/env ruby -wKU
=begin
  Name: 2e_rectangle_class.rb
  Description: Rectangle Class
  Author: Arvinder Kang
  Date: 2014-08-15
  Licensed under the MIT license
=end

class Rectangle
  attr_reader :area, :perimeter
  def initialize(width, height)
    @area = width * height
    @perimeter = 2 * width.+(height)
  end
end

r = Rectangle.new(23.45, 34.67)
puts "Area is = #{r.area}"
puts "Perimeter is = #{r.perimeter}"
