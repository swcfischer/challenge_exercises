class Trinary
  attr_reader :trinary_chars
  def initialize(number)
    @trinary_chars = number.chars
  end

  def to_decimal
    return 0 if invalid_trinary_number?
    result = 0
    trinary_chars.size.times do |num|
      last_integer = trinary_chars.pop
      result += last_integer.to_i * 3**num
    end
    result
  end

  def invalid_trinary_number?
    !!trinary_chars.join.match(/([^\d]|[3-9])/)
  end
end

first_test = Trinary.new('carrot')

p first_test.to_decimal

second_test = Trinary.new('100')

p second_test.to_decimal