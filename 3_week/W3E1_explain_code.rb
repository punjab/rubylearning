def method
  a = 50
  puts a
  # puts a.object_id
end

a = 10
method
puts a
# puts a.object_id

=begin
This displays like so:

50
10
=end

# Methods have their own scope when it comes to local-variable. Both variable named a are different variables in different contexts. It can be show by adding id method to each object.
#
# Update: Object_id comparision is flawed as Fixnums have same id
# >> a = "bob" #=> "bob"
# >> b = "bob" #=> "bob"
# >> a.object_id #=> 70187965949460
# >> b.object_id #=> 70187961729200
# >> c = 4 #=> 4
# >> d = 4 #=> 4
# >> c.object_id #=> 9
# >> d.object_id #=> 9
