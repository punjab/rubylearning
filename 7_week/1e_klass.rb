#!/usr/bin/env ruby -wKU
=begin
  Name: 1e_klass.rb
  Description: Klass
  Author: Arvinder Kang
  Date: 2014-08-28
  Licensed under the MIT license
=end
class Klass
  def initialize(greeting='')
    @greeting = greeting
  end

  def say_hello
    @greeting
  end
end
