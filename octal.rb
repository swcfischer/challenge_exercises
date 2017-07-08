
class Octal
  attr_reader :decimal_number
  BASE = 8
  INVALID_OCTAL = /\D|[8-9]/
  def initialize(number)
    @decimal_number = number.to_i
  end
  
  def to_decimal
    @decimal_number.to_s =~ INVALID_OCTAL ? 0 : calculate
  end

  private
  def calculate
    return 0 if decimal_number == 0
    return 1 if decimal_number < 9
    times = decimal_number.to_s.length - 1
    result = 0
    store_value = decimal_number
    
    loop do
      multiplier, remainder = store_value.divmod( 10 **times)
      result += multiplier * (BASE**times)
      store_value = remainder
      times = remainder.to_s.length - 1
      break if store_value == 0
    end
    
    result
  end
end



secon_try = Octal.new(1)

p secon_try.to_decimal









