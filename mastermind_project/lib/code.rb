class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def initialize(chars)
    if Code.valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise "contains non valid pegs"
    end
  end

  def self.random(number)
    randoms = []
    number.times { randoms << POSSIBLE_PEGS.keys.sample }
    Code.new(randoms)
  end

  def self.from_string(string)
    Code.new(string.split(""))
  end

  def [](index)
    @pegs[index]
  end

  def length
   @pegs.length
  end

  def num_exact_matches(guess)
    count = 0
    (0...guess.length).each do |idx|
      count += 1 if guess[idx] == self[idx]
    end
      count
  end

  def num_near_matches(guess)
    count = 0
    (0...guess.length).each do |idx|
      if guess[idx] != self[idx] && self.pegs.include?(guess[idx])
        count += 1
      end
    end
    count
  end

  def ==(another)
    self.pegs == another.pegs
  end
end
