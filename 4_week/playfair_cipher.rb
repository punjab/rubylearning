#!/usr/bin/env ruby -wKU
=begin
  Name: playfair_cipher.rb
  Description: Playfair Cipher
  Author: Arvinder Kang
  Date: 2014-08-18
  Licensed under the MIT license
=end

=begin
  doctest: Form inpute message
  >> input_message('Hide the gold in the tree stump')
  => "HIDETHEGOLDINTHETREXESTUMP"
=end

def create_table(text)
  result = ''
  letters = text.upcase.scan(/[A-Za-z]/)
  alphabets = letters + (('A'..'Z').to_a - letters)
  j_index = alphabets.index('J')
  alphabets[j_index] = 'I'
  alphabets.uniq!
  5.times do
    5.times do
      result << alphabets.shift << " "
    end
    result << "\n"
  end
  result
end

puts create_table("playfair example")
puts
puts create_table("I Love Ruby.")
