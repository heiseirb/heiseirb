class Integer
  def to_eto
    animal = ['子', '丑', '寅', '卯', '辰', '巳', '午', '未', '申', '酉', '戌', '亥']
    animal[(self + 8) % 12]
  end
end
