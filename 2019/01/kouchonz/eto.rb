class Integer
  def to_eto
    array = ['申', '酉', '戌', '亥', '子', '丑', '寅', '卯', '辰', '巳', '午', '未']
    return array[self % array.count]
  end
end
