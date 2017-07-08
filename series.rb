require 'pry'
class Series
  def initialize(numbers)
    @string = numbers
  end

  def slices(size)
    raise ArgumentError if size > @string.length
    result = []
    array = @string.chars
    array = array.map { |num| num.to_i }
    iterations = array.size - size
    length = -1 - (size - 1)
    limit = -1
    while iterations >= 0
      result.unshift(array[length..limit])
      iterations -= 1
      length -= 1
      limit -= 1
    end
    result
  end 
end
