require 'pry'
class Luhn
  def initialize(number=0)
    @value = number
  end

  def addends(numbers=@value)
    result = numbers.digits
    second_result = result.map.with_index do |number, idx|
      idx.odd? ? number * 2 : number
    end.reverse

    second_result.map do |number|
      if number > 9
        number -= 9
      else
        number
      end
    end
  end

  def checksum(numbers=@value)
    addends(numbers).inject(:+)
  end

  def valid?(number=@value)
    checksum(number) % 10 == 0
  end

  def self.create(number)
    temporary = self.new(number)
    if temporary.valid?(number)
      temporary.checksum(number)
    else
      foo = temporary.checksum(number * 10)
      result, remainder = foo.divmod(10)
      return number * 10 if remainder == 0
      number * 10 + (10 - remainder)
    end
  end

end

luhn = Luhn.new(123)
p luhn.checksum(873_9560)