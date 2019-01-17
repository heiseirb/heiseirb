# frozen_string_literal: true

class Integer
  # 西暦を与えて十二支を返すメソッド
  ETOS = %w[申 酉 戌 亥 子 丑 寅 卯 辰 巳 午 未].freeze
  def to_eto
    raise '負の値です．' if self < 0
    return ETOS[self % ETOS.size]
  end
end
