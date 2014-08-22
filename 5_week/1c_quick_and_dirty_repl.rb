#!/usr/bin/env ruby -wKU
=begin
  Name: 1c_quick_and_dirty_repl.rb
  Description: Quick and easy prompt
  Author: Arvinder Kang
  Date: 2014-08-21
  Licensed under the MIT license
=end
puts "Starting home distilled simple REPL in 3..2..1.."
response = ''
until response =~ /^exit$/
  prompt = "$ "
  print prompt
  response = gets.chomp
  begin
    output = eval(response)
  rescue => e
    puts "Invalid input : #{e.class}"
  end
  puts "=> #{output}"
end
puts "You are exiting our REPL"
