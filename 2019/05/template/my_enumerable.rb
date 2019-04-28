module Enumerable
  undef find
  def find; end

  # undef map
  # def map; end

  undef each_with_object
  def each_with_object; end

  # undef group_by
  # def group_by; end

  def tally; end
end

class Array
  undef zip
  def zip; end
end