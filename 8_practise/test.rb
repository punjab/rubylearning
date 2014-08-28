class Ticket

  def venue

    'Town Hall'

  end

  def performer

    'Mark Twain'

  end

  def price

    5.50

  end

  def seat

    'Second Balcony, row J, seat 12'

  end

  def event

    "Author's reading"

  end

end

ticket = Ticket.new
print "Information desired:"
request = gets.chomp
if ticket.respond_to?(request)
  puts ticket.send(request)
else
  puts "No such information available"
end
