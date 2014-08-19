#!/usr/bin/env ruby -wKU
=begin
  Name: playfair_cipher.rb
  Description: Playfair Cipher
  Author: Arvinder Kang
  Date: 2014-08-18
  Licensed under the MIT license
=end

=begin
  doctest: Create a 5x5 table for "playfair example"
  >> create_table("playfair example")
  =>P L A Y F 
    I R E X M 
    B C D G H 
    K N O Q S 
    T U V W Z 
  doctest: Create a 5x5 table for "I Love Ruby."
  >> create_table("I Love Ruby.")
  =>I L O V E 
    R U B Y A 
    C D F G H 
    K M N P Q 
    S T W X Z 
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
  >> prepare_message("Congress shall")
  => "CO NG RE SX SZ SH AL LX"
  doctest: prepare message "Hide the gold in the tree stump"
  >> prepare_message("Hide the gold in the tree stump")
  => "HI DE TH EG OL DI NT HE TR EX ES TU MP"
=end
def prepare_message(text)
  make_pairs(scan_for_indentical(text)).join(' ')
end
