class RomanNumber
  FORMAT = /\A(M{0,3})(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})\z/

  CHAR_INT_MAP = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }.freeze

  class << self
    def convert_from_integer(value)
      raise ArgumentError, "Expected integer, got #{value}" unless value.is_a?(Integer)
      raise ArgumentError, "Expected 0 to 3999, got #{value}" unless (0..3999).cover?(value)

      roman_value, _ = [1000, 100, 10, 1].inject(['', value]) do |(s, i), divisor|
        [
          s + CHAR_INT_MAP.invert[divisor] * (i / divisor),
          i % divisor
        ]
      end

      RomanNumber.new(
        roman_value.gsub(/C{9}/, 'CM')
                   .gsub(/C{5}/, 'D')
                   .gsub(/C{4}/, 'CD')
                   .gsub(/X{9}/, 'XC')
                   .gsub(/X{5}/, 'L')
                   .gsub(/X{4}/, 'XL')
                   .gsub(/I{9}/, 'IX')
                   .gsub(/I{5}/, 'V')
                   .gsub(/I{4}/, 'IV')
      )
    end
  end

  def initialize(value)
    raise ArgumentError, "Invalid format (given #{value})" unless value.match?(FORMAT)

    @value = value
  end

  def to_s
    @value
  end

  def to_i
    @value.gsub('IV', 'IIII')
          .gsub('IX', 'VIIII')
          .gsub('XL', 'XXXX')
          .gsub('XC', 'LXXXX')
          .gsub('CD', 'CCCC')
          .gsub('CM', 'DCCCC')
          .chars
          .map { |char| CHAR_INT_MAP[char] }.sum
  end
end
