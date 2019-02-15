class Array
  def to_biggest_num
    target = []
    self.each_with_index do |nums, index|
      #return raise_error(NecessaryValueError) if nums.class != [Integer, Float]
      #return raise_error(NecessaryValueError) if nums.class < 0
      target << [nums.to_s[0, 1].to_i, index]
    end
    target = target.sort {|a, b| b[0] <=> a[0] }
    ans = []
    target.each do |x|
      ans << self[x[1]]
    end
    ans.join('').to_i
  end
end
