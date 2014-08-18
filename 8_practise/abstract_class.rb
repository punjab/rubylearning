class Bubba
  def welcome
    puts "#{hello} #{name}"
  end
end

class BubbaDefined < Bubba
  def hello
    "hello"
  end
  def name
    "World!"
  end
end

b = BubbaDefined.new
b.welcome