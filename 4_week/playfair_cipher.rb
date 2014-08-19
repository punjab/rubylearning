#!/usr/bin/env ruby -wKU
=begin
  Name: playfair_cipher.rb
  Description: Playfair Cipher
  Author: Arvinder Kang
  Date: 2014-08-18
  Licensed under the MIT license
=end


def matrix(text)
  square = Array.new(5){Array.new(5,0)} 
  letters = text.upcase.scan(/[A-Za-z]/)
  alphabets = letters + (('A'..'Z').to_a - letters)
  alphabets.each.with_index {|e,i| alphabets[i] = 'I' if e == 'J'}
  alphabets.uniq!
  5.times do |i|
    5.times do |j|
      square[i][j] = alphabets.shift
    end
  end
  square
end

=begin
  doctest: Create a 5x5 table for "playfair example"
  >> display_table("playfair example")
  =>P L A Y F
    I R E X M
    B C D G H
    K N O Q S
    T U V W Z
  doctest: Create a 5x5 table for "I Love Ruby."
  >> display_table("I Love Ruby.")
  =>I L O V E
    R U B Y A
    C D F G H
    K M N P Q
    S T W X Z
=end
def display_table(text)
  result = ''
  square = matrix(text)
  5.times do |i|
    result << square[i].join(' ') << '\n'
  end
  result
end

def make_pairs(text)
  pairs = text.scan(/../)
  if text.length.odd?
    last_letter = text.scan(/.$/)
    last_pair = last_letter[0] << 'X'
    pairs << last_pair
  end
  pairs
end

def scan_for_indentical(t)
  text = t.upcase.gsub(/\s+/, "")
  insert_char = 'X'
  text.each_char.with_index do |e, i|
    if i.odd?
      if text[i-1] == text[i]
        text.insert(i, insert_char)
        insert_char = (insert_char == 'X' ? 'Z' : 'X')
      end
    end
  end
  text
end

=begin
  doctest: prepare message "Congress shall"
  >> display_message("Congress shall")
  => "CO NG RE SX SZ SH AL LX"
  doctest: prepare message "Hide the gold in the tree stump"
  >> display_message("Hide the gold in the tree stump")
  => "HI DE TH EG OL DI NT HE TR EX ES TU MP"
=end
def display_message(text)
  make_pairs(scan_for_indentical(text)).join(' ')
end
