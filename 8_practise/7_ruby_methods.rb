# obj.send
class Klass
  def hello(*args)
    "Hello " + args.join(' ')
  end
end

k = Klass.new
puts k.send :hello, "gentle", "readers"
