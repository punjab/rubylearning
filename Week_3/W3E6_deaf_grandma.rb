#!/usr/bin/env ruby -wKU
=begin
  Name: W3E6_deaf_grandma.rb
  Description: Deaf Grandma
  Author: Arvinder Kang
  Date: 2014-08-05
  Licensed under the MIT license
=end

module Voicetone
  refine String do
    def shouted?
      self == self.upcase
    end
  end
end

class Grandma
  using Voicetone
  
  def initialize(years_remembered)
    @years_remembered = years_remembered
  end
  
  def hears?(words)
    (words =~ /BYE/) ? false : "NO, NOT SINCE #{rand(@years_remembered)}"
  end
  
  def says(i_said)
    i_said.shouted? ? hears?(i_said) : 'HUH?! SPEAK UP, SONNY!'
  end
end

years_remembered = (1930..1950)
granny = Grandma.new(years_remembered)

response = ''
while response
  print "Say something to grandma: "
  puts response if response =  granny.says(gets)
end
