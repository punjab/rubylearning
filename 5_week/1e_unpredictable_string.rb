#!/usr/bin/env ruby -wKU
=begin
  Name: 1e_unpredictable_string.rb
  Description: Random String
  Author: Arvinder Kang
  Date: 2014-08-20
  Licensed under the MIT license
=end

class UnpredictableString < String
  def initialize(text)
    super text.to_s
    @text = text.to_s
  end

  def scramble
    @text.scan(/./).sample(@text.length).join
  end
  
  def to_s
    #scramble
    "This is blah"
  end
end

t = UnpredictableString.new("It was a dark and stormy night.")
puts t #=> It was a dark and stormy night.
puts t.scramble

=begin
It appears it is not possible, as to_s method is not being called at all in the case of a string. Unless we explicitely call to_s, it is not going to be called for a String.

Additonal references:
http://stackoverflow.com/questions/9848095/in-a-ruby-class-that-inherits-from-string-how-do-i-get-my-string-with-expl

=end