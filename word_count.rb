require 'pry'
class Phrase
  def initialize(phrase)
    @total = phrase.split(/[\s,]/).map { |word| word.gsub(/[^a-zA-Z1-9']|^'|'$/, '')}
    @phrase = phrase.split(/[\s,]/).uniq.map { |word| word.gsub(/[^a-zA-Z1-9']|^'|'$/, '')}
  end

  def word_count
    counts = {}
    @phrase.each do |word|
      next if word == ""
      counts[word.downcase] = @total.map(&:downcase).count(word.downcase)
    end
    counts
  end
end

phrase = Phrase.new('one of each')
counts = { 'one' => 1, 'of' => 1, 'each' => 1 }
p phrase.word_count


phrase = Phrase.new("First: don't laugh. Then: don't cry.")
    counts = {
      'first' => 1, "don't" => 2, 'laugh' => 1,
      'then' => 1, 'cry' => 1
    }
 p phrase.word_count
