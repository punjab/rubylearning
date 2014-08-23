#!/usr/bin/env ruby -wKU
=begin
  Name: 1e_class_person.rb
  Description: Person class
  Author: Arvinder Kang
  Date: 2014-08-22
  Licensed under the MIT license
=end

class Person
  attr_reader :balance

  def initialize(balance)
    @balance ||= balance
  end
end

p = Person.new('stable')
puts p.balance
q = Person.new(300000)
puts q.balance
