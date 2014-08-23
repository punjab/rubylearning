#!/usr/bin/env ruby -wKU
=begin
  Name: 1c_quick_and_dirty_repl.rb
  Description: Quick and easy prompt
  Author: Arvinder Kang
  Date: 2014-08-21
  Licensed under the MIT license
=end

if ARGV.first == '--help'
  puts <<END

  Usage: ruby 1c_quick_and_dirty_repl.rb [s]

    where
      s :  is the number of seconds to wait before launch. Defaults to 3.

END
  exit
end

class Repl
  def countdown(seconds=3)
    counter = seconds
    print "Launchin in ..."
    seconds.times { print "#{counter}..."; counter -= 1; sleep 1}
    puts
  end
  
  def ask(input)
    begin
      output ||= eval(input)
      result = "#=> \033[37m#{output}\033[0m"
    rescue => e
      result =  "\033[31m#{e.class} : #{e.message}\033[0m"
    end
    # Strip colot if < 8 bit color
    `tput colors`.to_i < 8 ? result.gsub(/\033\[\d+m/, "") : result
  end
end


if __FILE__ == $0
  repl = Repl.new
  ARGV.empty? ? repl.countdown : repl.countdown(ARGV[0].to_i)
  puts "Welcome to MY-RB. You are using #{`ruby -v`.chomp}. Have fun ;)"
  response = ''
  until response =~ /^exit$/
    print ">> "
    input = STDIN.gets
    response = repl.ask(input)
    puts response
  end
  puts "You are exiting our REPL"
end

