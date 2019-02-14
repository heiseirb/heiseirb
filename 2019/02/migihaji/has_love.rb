class HasLove
  def initialize(sentence: nil)
    @str = sentence
    @lines = @str.lines(chomp: true)
    @chars = @lines.map{ |c| c.each_char.to_a }
  end
  def find
    @chars
  end
end
