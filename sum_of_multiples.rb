class SumOfMultiples
  attr_reader :divisors
  def initialize(*divisors)
    @divisors = divisors
  end

  def self.to(limit)
    new(3, 5).to(limit)
  end

  def to(final_number)
    (0...final_number).to_a.select { |num| divisors.any? { |divisors| num % divisors == 0 } }.inject(:+)
  end

end

p SumOfMultiples.to(1)

p SumOfMultiples.to(10)