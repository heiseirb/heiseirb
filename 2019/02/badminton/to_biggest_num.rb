require_relative ('./error.rb')
class Array
  def to_biggest_num
    self.each do |number|
      raise NecessaryValueError if number.class != Fixnum && number.class != Float
      raise NecessaryValueError if number.negative?
    end

    result = []
    result = self.map do |number|
      number.to_s if number.class == Fixnum
    end
    str = result.compact.sort.reverse.join('')

    float_str = ''
    self.each do |number|
      float_str = number.to_s if number.class == Float
    end

    (str + float_str).to_f
  end
end
