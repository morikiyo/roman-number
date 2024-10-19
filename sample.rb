require './src/roman_number'

def deromanize(value)
  RomanNumber.new(value).to_i
end

def romanize(value)
  RomanNumber.convert_from_integer(value).to_s
end

integer_values = [
  1,
  444,
  999,
  2024,
  3999
]

roman_values = integer_values.map do |integer_value|
  roman_value = romanize(integer_value)

  puts "#{integer_value} => #{roman_value}"

  roman_value
end

puts '' # New line

roman_values.each do |roman_value|
  puts "#{roman_value} => #{deromanize(roman_value)}"
end
