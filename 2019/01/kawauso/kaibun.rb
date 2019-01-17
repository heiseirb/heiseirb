class String
  def to_kaibun
    index = self.index("*")
    count = self.scan(/\*/).count
    replacer = self.reverse.split("")[index..(index+count-1)].join("")
    self.sub((self.scan(/\*/).join("")), replacer)
  end
  # def to_kaibun
  #   # self.chars.to_a.count % 2 == 0 ? self.even : self.od
  #   self.even
  # end
  # def even
  #   arr = self.chars.to_a
  #   (arr[0..arr.length / 2] + arr[0..arr.length / 2].reverse).join("")
  # end
end