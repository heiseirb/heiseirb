class Array
  def to_biggest_num
    raise NecessaryValueError unless only_greater_than_or_equal_to_zero_integer?
    float = self.select{|i| i.class == Float }
    self.delete(float[0]) unless (float.empty?)
    joined = self.map{|i| [i.to_s[0,1],i.to_s]}.sort.reverse.map{|i| i[1]}.join
    joined = joined + float[0].to_s unless (float.empty?)
    return joined.to_f unless (float.empty?)
    joined.to_i
  end

  private

  def only_greater_than_or_equal_to_zero_integer?
    !include_string? && !include_hash? && !include_array? && !include_less_than_zero_integer?
  end

  def include_string?
    select { |element| element.class == String }.size != 0
  end

  def include_hash?
    select { |element| element.class == Hash }.size != 0
  end

  def include_array?
    select { |element| element.class == Array }.size != 0
  end

  def include_less_than_zero_integer?
    reject { |element| element >= 0 }.size != 0
  end

  def include_float?
    select { |element| element.class == Float }.size != 0
  end
end

class NecessaryValueError < StandardError; end
