require_relative ('./error.rb')
class HasLove
  def initialize(sentence:)
    @arr = sentence.split("\n").map(&:chars)
  end
  def find(start_col, end_col, start_row, end_row)
    start_col -= 1
    end_col -= 1
    start_row -= 1
    end_row -= 1
    raise OutOfRangeError if end_col >= 20 || end_row >= 20
    raise InvalidRangeError if start_col > end_col || start_row > end_row

    rows = @arr[start_col..end_col]
    rows = rows.map{|row| row[start_row..end_row]}
    rows.each do |row|
      return true if row.join('').match("LOVE")
    end
    (end_col - start_col).times do |i|
      str = ''
      rows.map do |row|
        str += row[i]
      end
      return true if str.match("LOVE")
    end
    false
  end
end