#!/usr/bin/env ruby
$DEBUG = true # easy way to toggle debugging puts
=begin
  Name: 3e_deaf_grandma_modified.rb
  Description: Deaf Grandma modified
  Author: Arvinder Kang
  Date: 2014-08-15
  Licensed under the MIT license
=end

=begin
doctest: setup
>> @granny = Grandma.new(1930..1950)
doctest: hears? returns a true or false (or something or nil)
>> @granny.hears?("not shouted")
=> false
doctest: hears? "SHOUTED" should be heard
>> @granny.hears?("SHOUTED WORDS")
=> true
doctest: She hears "BYE" but still returns false
>> @granny.hears? "BYE"
=> false
doctest: says("SOMETHING")
>> @granny.says("SOMETHING").include? "NOT SINCE"
=> true
doctest: Responds to not shouting
>> @granny.says('not shouting').include? 'SPEAK UP'
=> true
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

  def initialize(years_remembered, deafness = 3)
    @years_remembered = years_remembered
    @bye_count = 0
    @deafness = deafness
  end

  def hears?(words)
    words = words.chomp
    words.shouted? && words != 'BYE'
  end

  def says(i_said)
    if i_said.chomp =~ /^BYE$/
      @bye_count += 1
      return @bye_count != 3 ? '' : false
    else
      @bye_count = 0
    end

    hears?(i_said) ?
      "NO, NOT SINCE #{rand(@years_remembered)}" :
      'HUH?! SPEAK UP, SONNY!'
  end

end

if __FILE__ == $0 # application or library guard
  years_remembered = (1930..1950)
  granny = Grandma.new(years_remembered)

  response = ''
  while response
    print "Say something to grandma: "
    i_say = gets.chomp
    puts response if !i_say.empty?  and response =  granny.says(i_say)
  end
end
