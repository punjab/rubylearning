my_string = 'Hello Ruby World'

def my_string
    'Hello World'
end

puts my_string

# Local variable always wins in this scope conflict
# The conflict itself occurs because Ruby allows method call without an explicit reciever,
# self - in this case and without a parenthesis.
# To explicitely call the method, parenthesis can be added to method call.

puts my_string()

# Object's method "method" takes a string or a symbol and returns the an object encapsulating the bound method
puts method(:my_string).call
