class Array

  def to_biggest_num
    inputNum = self
    inputNum.permutation(self.length).map{|a| a.join.to_i}.max
  end
end
