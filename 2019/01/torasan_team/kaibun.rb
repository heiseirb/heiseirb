class String
  def to_kaibun
    target = self.dup
    return '対応していません' if including_unexpected_char? || only_wildcard?

    rev = target.reverse
    return target if already_palindrome?
    return '回文には出来ません' unless target.include?('*')
    target.each_char.with_index do |c, i|
      return '対応していません' if c == '*' && rev[i] == '*'
      target[i] = rev[i] if c == '*'
    end
    return '対応していません' if target.include?('*')
    target
  end

  private

  def including_unexpected_char?
    self.delete('NO*').size > 0
  end

  def only_wildcard?
    self.delete('*').size == 0
  end

  def already_palindrome?
    self == self.reverse && !self.include?('*')
  end
end