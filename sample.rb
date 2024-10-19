require './src/roman_number'
require './src/romanizer'

romanizer = Romanizer.new

roman_values = %w[
  I
  CDXLIV
  CMXCIX
  MMXXIV
  MMMCMXCIX
]

roman_values.each do |roman_value|
  puts "#{roman_value} => #{romanizer.deromanize(roman_value)}"
end

puts '' # New line

integer_values = [
  1,
  444,
  999,
  2024,
  3999
]

integer_values.each do |integer_value|
  puts "#{integer_value} => #{romanizer.romanize(integer_value)}"
end
