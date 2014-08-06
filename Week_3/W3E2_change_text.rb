#!/usr/bin/env ruby -wKU
=begin
  Name: W3E2_change_text.rb
  Description: Replace word in text
  Author: Arvinder Kang
  Date: 2014-07-25
  Licensed under the MIT license
=end
def replace_word_in_text(text, orignal_word, replaced_word)
  regex = %r[\b#{orignal_word}\b]
  text.gsub(regex, replaced_word)
end

begin
  puts "Enter the file name that you want to change: "
  STDOUT.flush
  filename = gets.chomp
  File.open(filename, 'r+') do |file|
    text = file.readlines.join
    file.seek(0)
    file.write(replace_word_in_text(text, 'word', 'inserted word'))
  end
end if __FILE__ == $0
