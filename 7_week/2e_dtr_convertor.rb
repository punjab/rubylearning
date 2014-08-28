#!/usr/bin/env ruby -wKU
=begin
  Name: 2e_dtr_convertor.rb
  Description: DTRConvertor
  Author: Arvinder Kang
  Date: 2014-08-28
  Licensed under the MIT license
=end
class DTRConvertor
  def convert(dollar_amount)
    dollar_amount * 40.0 # Bug here
  end
end

module CurrencyConverter
  refine DTRConvertor do
    def convert(dollar_amount)
      dollar_amount * 38.0 # Bug Fixed
    end
  end
end


using CurrencyConverter

m = DTRConvertor.new
puts m.convert(100.0)
