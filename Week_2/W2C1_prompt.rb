#!/usr/bin/env ruby -wKU
=begin
  Name: W2C1_prompt.rb
  Description: String as prompt
  Author: Arvinder Kang
  Date: 2014-07-24
  Licensed under the MIT license
=end
def prompt(text, prompt_symbol = ">>")
  print "#{text} #{prompt_symbol} "
  STDOUT.flush
  input = gets
  input.downcase =~ /^exit/ ? confirm_and_exit(input) : input
end

def confirm_and_exit(input)
  puts "Do you really want to exit the prompt? Y/N"
  STDOUT.flush
  user_response = gets
  abort("Bye Now!") if user_response.downcase =~ /^y.*/
  print user_response
end

# Test the method
until false
  puts prompt('Say Something: ', '$')
end