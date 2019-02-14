class Array
  def to_biggest_num
    raise NecessaryValueError.new unless self.all? { |n| n.is_a?(Integer) }
  end
end

class NecessaryValueError < StandardError
end
