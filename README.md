# RomanNumber

[第4回スキルアップ勉強会「あなたもチャレンジ！コードレビューライブ 〜伊藤淳一からの挑戦状〜」](https://sonicgarden.connpass.com/event/332113/)

## Usage

```ruby
require './src/roman_number'

puts RomanNumber.new('MMMCMXCIX').to_i # => 3999
puts RomanNumber.convert_from_integer(3999).to_s # => MMMCMXCIX
```
