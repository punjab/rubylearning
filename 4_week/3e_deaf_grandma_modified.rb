#!/usr/bin/env ruby
$DEBUG = true # easy way to toggle debugging puts
=begin
  Name: 3e_deaf_grandma_modified.rb
  Description: Deaf Grandma modified
  Author: Arvinder Kang
  Date: 2014-08-15
  Licensed under the MIT license
=end
module Voicetone
  refine String do
    def shouted?
      self == self.upcase
    end
  end
end

# doctest: setup
# >> @granny = Grandma.new(1930..1950)
class Grandma
  using Voicetone

  def initialize(years_remembered, deafness = 3)
    @years_remembered = years_remembered
    @bye_count = 0
    @deafness = deafness
  end

  # doctest: hears? returns a true or false (or something or nil)
  # >> @granny.hears?("not shouted")
  # => false
  # doctest: hears? "SHOUTED" should be heard
  # >> @granny.hears?("SHOUTED WORDS")
  # => true
  # doctest: She hears "BYE" but still returns false
  # >> @granny.hears? "BYE"
  # => false
  def hears?(words)
    words = words.chomp
    words.shouted? && words != 'BYE'
  end

  # doctest: says("SOMETHING")
  # >> @granny.says("SOMETHING").include? "NOT SINCE"
  # => true
  # doctest: Responds to not shouting
  # >> @granny.says('not shouting').include? 'SPEAK UP'
  # => true
  # doctest: BYE three times in a row
  # >> 4.times.map { @granny.says('BYE') }
  # => ''
  def says(i_said)
    bye_count(i_said)
    raise "We are done" if done?(i_said)
    done?(i_said) == true || hears?(i_said) ?
      "NO, NOT SINCE #{rand(@years_remembered)}" :
      'HUH?! SPEAK UP, SONNY!'
  end
  private
  def done?(words)
    if $DEBUG
      puts @bye_count
      puts @deafness
    end
    bye_count words
    @bye_count == @deafness
  end

  def bye_count(word)
    word.chomp == /^BYE$/ ? @bye_count += 1 : @bye_count = 0
  end
end

if __FILE__ == $0 # application or library guard
  years_remembered = (1930..1950)
  granny = Grandma.new(years_remembered)

  response = ''
  while response
    print "Say something to grandma: "
    puts response if response =  granny.says(gets)
  end
end
