class Diary
  def initialize(contents, scrambler)
    @contents = contents
    @scrambler = scrambler
  end

  def read
    @contents
  end

  def scramble
    @contents = @scrambler.scramble(@contents)
  end

  def unscramble
    @contents = @scrambler.unscramble(@contents)
  end
end

class AdvanceScrambler
  def initialize(steps)
    @steps = steps
  end

  def scramble(text)
    plain_chars = text.chars
    scrambled_chars = plain_chars.map do |char|
      (char.ord + @steps).chr
    end
    scrambled_chars.join
  end

  def unscramble(text)
    scrambled_chars = text.chars
    plain_chars = scrambled_chars.map do |char|
      (char.ord - @steps).chr
    end
    plain_chars.join
  end
end

class ReverseScrambler
  def scramble(text)
    text.reverse
  end

  def unscramble(text)
    text.reverse
  end
end