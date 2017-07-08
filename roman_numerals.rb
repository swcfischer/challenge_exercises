
class Numeric
  ROMAN_NUMERAL = { 'M' => 1000, 'CM' => 900,
                    'D' => 500, 'CD' => 400,
                    'C' => 100, 'XC' => 90,
                    'L' => 50, 'XL' => 40,
                    'X' => 10, 'IX' => 9,
                    'V' => 5, 'IV' => 4,
                    'I' => 1 }

  def to_roman
    result = ""
    number = self
    ROMAN_numberERAL_CONVERSION.each do |roman_numberal, divisor|
      times, number = number.divmod(divisor)
      result += roman_numberal * times
    end

    result
  end
end