#!/usr/bin/env ruby -wKU
=begin
  Name: 1e_class_person.rb
  Description: Person class
  Author: Arvinder Kang
  Date: 2014-08-22
  Licensed under the MIT license
=end

class Person
  def initialize
    @balance = 0
  end

  attr_reader :balance
end

p = Person.new
puts p.balance
