class String
  def to_kaibun
    result = ''
    characters = split('')

    is_odd = characters.size.odd?

    loop do
      left = characters.shift
      right = characters.pop
      return '対応していません' if left == '*' && right.nil?
      break if left.nil? || right.nil?
      return '対応していません' if !['N', '*', 'O'].include?(left) || !['N', '*', 'O'].include?(right)

      return '対応していません' if left == '*' && right == '*'
      puts result
      result << [left, right].find{|c| c != '*'}

      return '回文には出来ません' if left != right && (left != '*' && right != '*')
    end

    if is_odd
      result + result.reverse.split('')[1..-1]
    else
      result + result.reverse
    end

  end
end


p 'NOONOON'.to_kaibun