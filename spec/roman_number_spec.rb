require './src/roman_number'

RSpec.describe RomanNumber do
  describe '#to_i' do
    context 'valid format' do
      where(:roman_value, :integer_value) do
        [
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
        ]
      end

      with_them do
        let(:roman_number) { described_class.new(roman_value) }

        it 'returns integer value' do
          expect(roman_number.to_i).to eq(integer_value)
        end
      end
    end
  end
end
