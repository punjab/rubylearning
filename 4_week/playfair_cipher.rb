#!/usr/bin/env ruby -wKU
=begin
  Name: playfair_cipher.rb
  Description: Playfair Cipher
  Author: Arvinder Kang
  Date: 2014-08-18
  Licensed under the MIT license
=end

# require 'Matrix'
#
# def matrix(text)
#   alphabets = clean_text(text)
#   Matrix.build(5){ alphabets.shift }
# end

def matrix(text)
  alphabets = clean_text(text)
  square = Array.new(5){Array.new(5,0)}
  5.times do |i|
    5.times do |j|
      square[i][j] = alphabets.shift
    end
  end
  square
end

def clean_text(text)
  letters = text.upcase.scan(/[A-Za-z]/)
  alphabets = letters + (('A'..'Z').to_a - letters)
  alphabets.each.with_index {|e,i| alphabets[i] = 'I' if e == 'J'}
  alphabets.uniq!
end

# def matrix(text)
#   square = Array.new(5){Array.new(5,0)}
#   letters = text.upcase.scan(/[A-Za-z]/)
#   alphabets = letters + (('A'..'Z').to_a - letters)
#   alphabets.each.with_index {|e,i| alphabets[i] = 'I' if e == 'J'}
#   alphabets.uniq!
#   5.times do |i|
#     5.times do |j|
#       square[i][j] = alphabets.shift
#     end
#   end
#   square
# end

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

# def display_table(text)
#   result = ''
#   square = matrix(text)
#   5.times do |i|
#     result << square.row(i).to_a.join(' ') << '\n'
#   end
#   result
# end

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
  >> m = matrix("playfair example")
  doctest: AF for matrix "playfair example" should return YP
  >> encode_pair('AF', m)
  => "YP"
  doctest: CG should return DH - Testing rule 1
  >> encode_pair('CG', m)
  => "DH"
  doctest: CU should return NL - Testing Rule 2
  >> encode_pair('CU', m)
  => "NL"
  doctest: IQ should return XK - Testing Rule 3
  >> encode_pair('IQ', m)
  => "XK"
  doctest: encode 'HI DE TH EG OL DI NT HE TR EX ES TU MP'
  >> encoded = %w(HI DE TH EG OL DI NT HE TR EX ES TU MP).map{|x| encode_pair(x, m)}
  >> encoded.join(' ')
  => "BM OD ZB XD NA BE KU DM UI XM MO UV IF"
=end

def encode_pair(pair, matrix)
  rule1 = row_encode(pair, matrix)
  return rule1 if rule1
  rule2 = row_encode(pair, transpose(matrix))
  return rule2 if rule2
  return encode_diagonal(matrix, pair)
end

def row_encode(pair, matrix)
  first = pair[0]
  second = pair[1]
  # Find in row
  matrix.each_with_index do |row, index|
    if row.include?(first) && row.include?(second)
      return next_in_row(row, first) + next_in_row(row, second)
    end
  end
  nil
end
def next_in_row(array, element)
  index = array.index(element)
  index == array.length - 1 ? array[0] : array[index+1]
end

def transpose(matrix)
  result = []
  matrix.each_index do |i|
    result << matrix.map {|row| row[i]}
  end
  result
end


def encode_diagonal(matrix, pair)
  first, second = [], []
  matrix.each.with_index do |row, i|
    if row.include?(pair[0])
      first = [i, row.index(pair[0])]
    end
    if row.include?(pair[1])
      second = [i, row.index(pair[1])]
    end
  end
  matrix[first[0]][second[1]] + matrix[second[0]][first[1]]
end