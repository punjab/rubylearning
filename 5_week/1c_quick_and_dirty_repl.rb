#!/usr/bin/env ruby -wKU
=begin
  Name: 1c_quick_and_dirty_repl.rb
  Description: Quick and easy prompt
  Author: Arvinder Kang
  Date: 2014-08-21
  Licensed under the MIT license
=end
puts "Welcome to MY-RB. You are using #{`ruby -v`.chomp}. Have fun ;)"
response = ''
until response =~ /^exit$/
  prompt = ">> "
  print prompt
  response = gets
  begin
    output = eval(response)
    puts "#=> \033[37m#{output}\033[0m"
  rescue => e
    puts "\033[31m#{e.class} : #{e.message}\033[0m"
  end
end
puts "You are exiting our REPL"
