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
      @value.gsub('IV', 'IIII')
            .gsub('IX', 'VIIII')
            .gsub('XL', 'XXXX')
            .gsub('XC', 'LXXXX')
            .gsub('CD', 'CCCC')
            .gsub('CM', 'DCCCC')
    end
end
