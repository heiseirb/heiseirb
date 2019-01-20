class String

  UNSUPPORTED_ERROR = '対応していません'
  PALINDROME_ERROR = '回文には出来ません'

  def to_kaibun
    self.upcase!

    return UNSUPPORTED_ERROR if self.match(/[^NO\*]/) ||
        ((self.length.odd?) &&
            (self[self.length/2] == '*'))
    if self.index('*')
      while (asterisk_number = self.index('*')) != nil do
        asterisk_string = self.reverse[self.index('*')]
        return UNSUPPORTED_ERROR if asterisk_string == '*'
        self.slice!(asterisk_number)
        self.insert(asterisk_number, asterisk_string)
      end
    end
    palindrome = self

    return PALINDROME_ERROR if palindrome != palindrome.reverse
    palindrome
  end
end
