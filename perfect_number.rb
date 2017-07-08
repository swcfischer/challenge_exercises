class PerfectNumber
  def self.classify(limit)
    raise(RuntimeError) if limit < 1

    result = (1...limit).select { |num| limit % num == 0 }.inject(&:+)
    if result > limit
      "abundant"
    elsif result == limit
      "perfect"
    else
      "deficient"
    end
  end
end

p PerfectNumber.classify(28)