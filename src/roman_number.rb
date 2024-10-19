class RomanNumber
  FORMAT = /\A(M{0,3})(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})\z/.freeze

  CHAR_INT_MAP = {
    'I' => 1,
    'V' => 5,
    'X' => 10,
    'L' => 50,
    'C' => 100,
    'D' => 500,
    'M' => 1000
  }.freeze

  NORMALIZATION_MAP = {
    'IV' => 'IIII',
    'IX' => 'VIIII',
    'XL' => 'XXXX',
    'XC' => 'LXXXX',
    'CD' => 'CCCC',
    'CM' => 'DCCCC',
  }

  class << self
    def convert_from_integer(value)
      raise ArgumentError, 'Not integer.' unless value.is_a?(Integer)
      raise ArgumentError, 'Out of range (0..3999)' unless (0..3999).cover?(value)

      tmp_value = value
      chars = []

      chars << 'M' * (tmp_value / 1000)
      tmp_value %= 1000

      chars << 'C' * (tmp_value / 100)
      tmp_value %= 100

      chars << 'X' * (tmp_value / 10)
      tmp_value %= 10

      chars << 'I' * tmp_value

      RomanNumber.new(
        chars.join
             .gsub(/C{9}/, 'CM')
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
    raise ArgumentError, "Invalid Roman Number, #{value}" unless value.match?(FORMAT)

    @value = value
  end

  def to_s
    @value
  end

  def to_i
    normalize_value.chars.map { |char| CHAR_INT_MAP[char] }.sum
  end

  private

    def normalize_value
      RomanNumber::NORMALIZATION_MAP.inject(@value) do |value, (from_str, to_str)|
        value.gsub(from_str, to_str)
      end
    end
end
