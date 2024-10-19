require './src/roman_number'

RSpec.describe RomanNumber do
  describe '#to_i, .convert_from_integer' do
    where(:roman_value, :integer_value) do
      [
        ['',       0],

        ['I',      1],
        ['II',     2],
        ['III',    3],
        ['IV',     4],
        ['V',      5],
        ['VI',     6],
        ['VII',    7],
        ['VIII',   8],
        ['IX',     9],

        ['X',     10],
        ['XX',    20],
        ['XXX',   30],
        ['XL',    40],
        ['L',     50],
        ['LX',    60],
        ['LXX',   70],
        ['LXXX',  80],
        ['XC',    90],

        ['C',    100],
        ['CC',   200],
        ['CCC',  300],
        ['CD',   400],
        ['D',    500],
        ['DC',   600],
        ['DCC',  700],
        ['DCCC', 800],
        ['CM',   900],

        ['M',   1000],
        ['MM',  2000],
        ['MMM', 3000],

        ['MMMCMXCIX', 3999],
        ['MDCLXXVIII', 1678],
        ['MXXI', 1021],
      ]
    end

    with_them do
      it 'returns integer value' do
        expect(described_class.new(roman_value).to_i).to eq(integer_value)
      end

      it 'converts integer value to RomanNumber' do
        expect(described_class.convert_from_integer(integer_value).to_s).to eq(roman_value)
      end
    end
  end

  describe 'format validation' do
    where(roman_value: [
      '-I',

      'IIII',
      'VIIII',
      'IVI',
      'IXI',

      'XXXX',
      'LXXXX',
      'XLX',
      'XCX',

      'XXXX',
      'LXXXX',
      'XLX',
      'XCX',

      'CCCC',
      'DCCCC',
      'CDC',
      'CMC',
    ])

    with_them do
      it 'raise ArgumentError' do
        expect { described_class.new(roman_value) }.to raise_error(ArgumentError, "Invalid format (given #{roman_value})")
      end
    end
  end
end
