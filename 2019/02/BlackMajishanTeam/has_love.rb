class HasLove
  def initialize sentence

  end
  def find(m, n, o, p)
    raise InvalidRangeError if m > n
    true
  end
end


class InvalidRangeError < StandardError
end

# sentence = <<~'EOS'
# TEOWMZGTZKRECDSBYSUY
# IIXIGGXYZLOVEETSFZNH
# JELOVEQHYKFEUEQBNQZO
# PQJXLOVEBFHMJUCTASAY
# FIGZOZABPAQGQZEMDVOG
# AXSMVWFSPFSUPALEZWFQ
# YXXQEDCBYTHBQCOKYSEP
# ZWLPXHVYFAPDYOVYRZAR
# SJSLLHVMZCDLOVEXWLOV
# NPGNDBMWAOPVXIGLPDXR
# EOS
# @has_love = HasLove.new(sentence: sentence)
# @has_love.find 9, 8, 11, 1
