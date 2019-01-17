class String
  def to_kaibun
    return "回文には出来ません" if /NONN/.match(self) # ????
    return "対応していません" if
      /^\*+$/.match(self) ||
      (!/\*/.match(self) && self != self.reverse)
    if self.length % 2 == 1
      return "対応していません" if self.chars.to_a[self.length / 2] == "*"
    end
    return self if self == self.reverse

    index = self.index("*")
    count = self.scan(/\*/).count
    replacer = self.reverse.chars.to_a[index..(index + count - 1)].join("")
    self.sub((self.scan(/\*/).join("")), replacer)
  end
end
