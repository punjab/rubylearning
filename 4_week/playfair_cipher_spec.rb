require 'minitest/autorun'
require_relative 'playfair_cipher'

describe "5x5 square table" do
  it "should create a 5x5 square table" do
    create_table('playfair example').must_equal('')
  end

  it "should create cipher" do
    input_message('Hide the gold in the tree stump').must_equal("HIDETHEGOLDINTHETREXESTUMP")
  end
end
