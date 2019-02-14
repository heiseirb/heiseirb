class OutOfRangeError < StandardError

end

class InvalidRangeError < StandardError

end

class HasLove
  def initialize(sentence: nil)
    @str = sentence
    @lines = @str.lines(chomp: true)
    @chars = @lines.map{ |c| c.each_char.to_a }
  end

  def find(top, bottom, left, right)
    raise OutOfRangeError if left > 20 || right > 20 || top > 10 || bottom > 10
    raise InvalidRangeError if top > bottom || left > right

    count = 1
    chars = @chars[top-1..bottom]
    slices = chars.map do |line|
      line[left-1..right]
    end

    slices.any? { |chars|
      chars.join('').include?('LOVE')
    }

  end
end
