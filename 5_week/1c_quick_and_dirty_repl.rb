#!/usr/bin/env ruby -wKU

=begin
  * Name: 1c_quick_and_dirty_repl.rb
  * Description: Quick and easy prompt
  * Author: Arvinder Kang
  * Date: 2014-08-21
  * Licensed under the MIT license
=end

module Repl
  
  # Default 3 second counter before launching REPL
  #
  # * Optional, can be disabled by setting parameter seconds to zero.
  
  def self.countdown(seconds=3)
    counter = seconds
    print "Launchin in ..."
    seconds.times { print "#{counter}..."; counter -= 1; sleep 1}
    puts
  end
  
  # Evaluates the input string and returns the output or error.
  #
  # * The result is ANSI colored.
  # * If terminal support less than 8 colors, color is stripped out.
  def self.ask(input)
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
  
  if ARGV.first == '--help'
    puts <<END
    Usage: ruby 1c_quick_and_dirty_repl.rb [s]
      where
        s :  is the number of seconds to wait before launch. Defaults to 3.
END
    exit
  end
  
  ARGV.empty? ? Repl.countdown : Repl.countdown(ARGV[0].to_i)
  puts "Welcome to MY-RB. You are using #{`ruby -v`.chomp}. Have fun ;)"
  response = ''
  until response =~ /^exit$/
    print ">> "
    input = STDIN.gets
    response = Repl.ask(input)
    puts response
  end
  puts "You are exiting our REPL"
end