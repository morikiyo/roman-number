require './src/roman_number'

def deromanize(value)
  RomanNumber.new(value).to_i
end

def romanize(value)
  RomanNumber.convert_from_integer(value).to_s
end

roman_values = %w[
  I
  CDXLIV
  CMXCIX
  MMXXIV
  MMMCMXCIX
]

roman_values.each do |roman_value|
  puts "#{roman_value} => #{deromanize(roman_value)}"
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
  puts "#{integer_value} => #{romanize(integer_value)}"
end
