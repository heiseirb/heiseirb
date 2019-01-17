# frozen_string_literal: true

class Integer
  # 西暦を与えて十二支を返すメソッド
  def to_eto
    raise '負の値です．' if self < 0
    etos = %w[申 酉 戌 亥 子 丑 寅 卯 辰 巳 午 未]
    return etos[self % 12]
  end
end
