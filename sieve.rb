require 'pry'
class Sieve
  attr_reader :limit, :primes, :divisors
  def initialize(limit)
    @limit = limit
    @divisors = initial_primes
    @primes = calculate_primes
  end

  private

  def calculate_primes
    store_integers = (1..limit).to_a
    store_integers.select do |element|
      indivisible?(element)
    end
  end


  def initial_primes
    new_array = (1..limit).to_a.select do |num|
      if num == 2
        true
      elsif num % 2 == 0
        false
      elsif num == 1
        false
      else
        true
      end
    end
    new_array
  end

  def indivisible?(number)
    return false if number == 1
    divisors.each do |num|
      next if num == number
      return true if number < num
      return false if number % num  == 0
    end
    true
  end
end  
steve = Sieve.new(1000)
p steve.primes