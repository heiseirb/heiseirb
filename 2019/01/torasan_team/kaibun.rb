class String
  def to_kaibun
    return '対応していません' if self.delete('NO*').size > 0
    return '対応していません' if self.delete('*').size == 0
    rev = self.reverse

    return self if self == rev && !self.include?('*')
    return '回文には出来ません' unless self.include?('*')
    self.each_char.with_index do |c, i|
      return '対応していません' if c == '*' && rev[i] == '*'
      self[i] = rev[i] if c == '*'
    end
   return '対応していません' if self.include?('*')

    self
  end
end