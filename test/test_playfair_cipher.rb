require_relative "test_helper"
require_relative "../4_week/playfair_cipher"

# describe "Testing 5x5 Square" do
#   it "should create a 5x5 square table" do
#     assert_equal 'P L A Y F
# I R E X M
# B C D G H
# K N O Q S
# T U V W Z
# ', create_table('playfair example')
#   end
# end


describe "Test Encoding" do
  it "should create digraphs" do
    encode("Congress shall").must_equal("CO NG RE SX SZ SH AL LX")
    encode("Hide the gold in the tree stump").must_equal("HI DE TH EG OL DI NT HE TR EX ES TU MP")
  end
end
