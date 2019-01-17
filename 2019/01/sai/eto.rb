class Integer
  def to_eto
    case self % 12
    when 0
      '申'
    when 1
      '酉'
    when 2
      '戌'
    when 3
      '亥'
    when 4
      '子'
    when 5
      '丑'
    when 6
      '寅'
    when 7
      '卯'
    when 8
      '辰'
    when 9
      '巳'
    when 10
      '午'
    when 11
      '未'
    end
  end
end