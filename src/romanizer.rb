class Romanizer
  def deromanize(value)
    RomanNumber.new(value).to_i
  end

  def romanize(value)
    RomanNumber.convert_from_integer(value).to_s
  end
end
