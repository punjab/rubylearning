=begin
  doctest: Test temperature scale conversions
  >> "%0.2f" % convert(80, 'c', 'K')
  => "353.15"
  >> "%0.2f" % convert(80, 'K', 'c')
  => "-193.15"
  >> "%0.2f" % convert(80, 'F', 'c')
  => "26.67"
  >> "%0.2f" % convert(80, 'F', 'k')
  => "299.82"
  >> "%0.2f" % convert(80, 'k', 'f')
  => "-315.67"
=end
