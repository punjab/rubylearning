#!/usr/bin/env ruby -wKU
=begin
  Name: 1c_quick_and_dirty_repl.rb
  Description: Quick and easy prompt
  Author: Arvinder Kang
  Date: 2014-08-21
  Licensed under the MIT license
=end

def countdown(seconds=3)
  counter = seconds
  puts "Launchin in ..."
  seconds.times { puts counter; counter -= 1; sleep 1}
end

def colorize(output)
  if `tput colors`.chomp.to_i < 8
    return output.gsub(/\033\[\d+m/, "")
  end
  output
end

ARGV.empty? ? countdown : countdown(ARGV[0])

puts "Welcome to MY-RB. You are using #{`ruby -v`.chomp}. Have fun ;)"
response = ''
until response =~ /^exit$/
  prompt = ">> "
  print prompt
  response = STDIN.gets
  begin
    output = eval(response)
    puts colorize "#=> \033[37m#{output}\033[0m"
  rescue => e
    puts colorize "\033[31m#{e.class} : #{e.message}\033[0m"
  end
end
puts "You are exiting our REPL"

