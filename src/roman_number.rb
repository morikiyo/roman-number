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

  def initialize(value)
    raise ArgumentError, 'Invalid Roman Number' unless value.match?(FORMAT)

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
