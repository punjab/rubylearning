# x = Thread.new{
#   sleep 0.1
#   print "x"
#   print "y"
#   print "z"
# }
#
# a = Thread.new{
#   print "a"
#   print "b"
#   sleep 0.2
#   print "c"
# }

# x.join
# a.join

# puts Thread.main
# puts ""
# t1 = Thread.new {sleep 100}
# Thread.list.each {|thr| p thr }
# puts "Current thread = " + Thread.current.to_s
# puts ""
# puts Thread.main
# puts ""
# t1 = Thread.new {sleep 100}
# Thread.list.each {|thr| p thr }
# puts "Current thread = " + Thread.current.to_s
# puts ""
#
# t2 = Thread.new {sleep 100}
# Thread.list.each {|thr| p thr }
# puts Thread.current
# puts "" 

require "socket"
dts = TCPServer.new('localhost', 20000)
loop do
  Thread.start(dts.accept) do |s|
    print(s, " is accepted\n")
    s.write(Time.now)
    print(s, " is gone\n")
    s.close
  end
end
