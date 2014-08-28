require 'socket'
streamSock = TCPSocket.new("localhost", 20000)
str = streamSock.recv(100)
print str
streamSock.close
