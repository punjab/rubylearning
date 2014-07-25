def mtdarry
  10.times do |num|
    puts num
  end
end

mtdarry
#=> It calls the method, which will run 10 times and print numbers 0 to 9.


def mtdarry
  10.times do |num|
    puts num
  end
end

puts mtdarry
#=> Calling puts should also print the return value, which is 10, after the loop exits.
