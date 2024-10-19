require './src/roman_number'

valid_samples = %w[
  I
  CDXLIV
  CMXCIX
  MMXXIV
  MMMCMXCIX
]

valid_samples.each do |sample|
  roman_number = RomanNumber.new(sample)
  puts "#{sample} => #{roman_number.to_i}"
end

puts '' # New line

invalid_samples = %w[
  VIIII
  MMMM
]

invalid_samples.each do |sample|
  RomanNumber.new(sample)
  puts "#{sample} => Unexpectedly, no error was raised"
rescue ArgumentError => e
  puts "#{sample} => #{e.message}"
end
