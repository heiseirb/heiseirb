require "pry"

class HasLove
  def initialize(sentence:)
    @arr = sentence.split("\n").map(&:chars)
  end
  def find(start_col, end_col, start_row, end_row)
    start_col -= 1
    end_col -= 1
    start_row -= 1
    end_row -= 1
    rows = @arr[start_row..end_row]
    rows.map{|row| row[start_col..end_col]}
    binding.pry
  end
end
