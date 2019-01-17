class Integer
  def to_eto
    self.validate
    index = self < 4 ? self % 12 + 8 : self % 12 - 4
    arr = %w(子 丑 寅 卯 辰 巳 午 未 申 酉 戌 亥)
    arr[index]
  end

  def validate
    if self.class != Integer
      puts "数値を入力してください"
    elsif self < 0
      puts "0以上の値を入力してください"
    elsif /\d{11,}/.match(self.to_s)
      puts "桁数が多すぎます"
    end
  end
end
