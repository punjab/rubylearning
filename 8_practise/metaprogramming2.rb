module TextManipulation
  refine String do
    def to_alphanumeric
      gsub /[^\w\s]/, ''
    end
  end
end

using TextManipulation

puts "#3, the *Magic, Number*?".to_alphanumeric

require 'test/unit'

class ToAlphanumericTest < Test::Unit::TestCase
  def test_strips_non_alphanumeric_characters
    assert_equal '3 the Magic Number', "#3, the *Magic, Number*?".to_alphanumeric
  end
end

