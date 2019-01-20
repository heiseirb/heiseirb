class String
  def to_kaibun
    return "対応していません" if
      /^\*+$/.match(self) ||
      (!/\*/.match(self) && self != self.reverse && !/(N|O|\*)/.match(self))
    return "対応していません" if
      /^((?!N).)*$/.match(self) && /^((?!O).)*$/.match(self) && /^((?!\*).)*$/.match(self)
    return "回文には出来ません" if (!/\*/.match(self) && self != self.reverse)
    if self.length % 2 == 1
      return "対応していません" if self.chars.to_a[self.length / 2] == "*"
    end
    return self if self == self.reverse

    kaibun = self.replace_asterisk
    return kaibun if kaibun == kaibun.reverse
    while kaibun != kaibun.reverse do
      kaibun = kaibun.replace_asterisk
    end
    kaibun
  end

  def replace_asterisk
    index = self.index("*")
    count = self.scan(/\*+/).first.length
    replacer = self.reverse.chars.to_a[index..(index + count - 1)].join("")
    self.sub(self.scan(/\*+/).first, replacer)
  end
end
