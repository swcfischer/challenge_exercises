class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(second_strand)
    if @strand.length <= second_strand.length
      calculate(@strand, second_strand)
    else @strand.length < second_strand.length
      calculate(second_strand, @strand)
    end
  end


  def calculate(first_strand, second_strand)
    result = 0
    first_strand.chars.each_with_index do |nucleotide, idx|
      result += 1 if nucleotide != second_strand[idx]
    end
    result
  end
end


p DNA.new('ACT').hamming_distance('GGA')
strand = 'GGACGGATTCTGACCTGGACTAATTTTGGGG'
distance = 'AGGACGGATTCTGACCTGGACTAATTTTGGGG'
p DNA.new(strand).hamming_distance(distance)


