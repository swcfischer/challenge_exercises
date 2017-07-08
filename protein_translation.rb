class Translation
CODONS = { Methionine: ["AUG"], Phenylalanine: ["UUU", "UUC"], Leucine: ["UUA", "UUG"], Serine: ["UCU", "UCC", "UCA", "UCG"],
           Tyrosine: ["UAU", "UAC"], Cysteine: ["UGU", "UGC"], Tryptophan: ["UGG"],
           STOP: ["UAA", "UAG", "UGA"]}

  def self.of_codon(codon)
    CODONS.each do |key, value|
      return key.to_s if value.include?(codon)
    end
    raise(InvalidCodonError) unless self.valid?(codon)
  end

  def self.valid?(codon)
    CODONS.values.flatten.include?(codon)
  end


  def self.of_rna(rna)
    start = 0
    limit = 2
    result = []

    while limit < rna.length
      result << self.of_codon(rna[start..limit])
      start += 3
      limit += 3
    end

    if result.include?("STOP")
     result = result[0..result.index("STOP") - 1]
    end

   result
 end

end

