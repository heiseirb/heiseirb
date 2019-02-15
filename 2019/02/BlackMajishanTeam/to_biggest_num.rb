class Array
  def to_biggest_num
    hash = {}
    str = ""
    self.each do |i|
      raise NecessaryValueError unless i.is_a?(Numeric)
      #is_aはclassがNumeric以外が通る
      raise NecessaryValueError if i.negative?

      hash[i.to_s[0].to_i] = i
    end
    sorted =  Hash[hash.sort.reverse]
    sorted.each do |k,v|
      str = str + v.to_s
    end
    return str.to_i
  end

  private

  def negative?
      self < 0
  end
end

class NecessaryValueError < StandardError
end
# [1, 2, 3, "string"].to_biggest_num
#[50, 2, 1, 9].to_biggest_num
