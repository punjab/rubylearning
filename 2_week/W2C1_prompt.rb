#!/usr/bin/env ruby -wKU
=begin
  Name: W2C1_prompt.rb
  Description: String as prompt
  Author: Arvinder Kang
  Date: 2014-08-05
  Licensed under the MIT license
=end

def prompt(text, prompt_symbol = ">>")
  print "#{text} #{prompt_symbol} "
  STDOUT.flush
  @last_response = gets
end

def affirmative?(response)
  !! (response.downcase =~ /^ye?s?$|Youbetcya/i)
end

def confirm_and_exit
  puts "Do you really want to exit the prompt? Y/N"
  STDOUT.flush
  affirmative?(gets) or print @last_response
end

# Test the method
puts response = prompt('Say Something', ' ->') until response.to_s.downcase =~ /^exit$/ && confirm_and_exit
