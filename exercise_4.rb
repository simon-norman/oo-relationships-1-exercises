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
    scramble_or_unscramble_using_block(text) { |char| (char.ord + @steps).chr }
  end

  def unscramble(text)
    scramble_or_unscramble_using_block(text) { |char| (char.ord - @steps).chr }
  end

  private
  
  def scramble_or_unscramble_using_block(text)
    chars = text.chars
    scrambled_or_unscrambled_chars = chars.map do |char|
      yield(char)
    end

    scrambled_or_unscrambled_chars.join
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