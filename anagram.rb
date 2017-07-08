class Anagram
  def initialize(string)
    @anagram = string
    @sorted_array = sort(string.downcase)
  end

  def match(collection)
    collection.select do |string|
      @anagram != string.downcase ? @sorted_array == string.downcase.chars.sort : false
    end
  end

  def sort(string)
    string.chars.sort
  end

end

detector = Anagram.new('listen')
anagrams = detector.match %w(enlists google inlets banana)
p anagrams
