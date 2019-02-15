class Array
  def to_biggest_num
    raise NecessaryValueError.new unless self.all? { |n| n.is_a?(Numeric) && n >= 0 }

    chars = self.map(&:to_s)
    sorted_char = chars.sort_by {|char| char[0]}.reverse
    sorted_char.join('').to_i
  end
end

class NecessaryValueError < StandardError
end
