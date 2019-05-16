module Enumerable
  def my_each
    for element in self
      yield element
    end
  end

  def my_find(arg_proc = -> { nil })
    my_each { |element| return element if yield element } && arg_proc&.call
  end

  def my_map
    inject(Array.new) { |any, element| any << (block_given? ? yield(element) : element) }
  end

  def my_each_with_object(receiver)
    reduce(receiver) { |_, element| receiver.tap { |myself| yield element, myself } }
  end

  def my_group_by
    inject(Hash.new { |hash, key| hash[(yield key)] = Array.new }) { |any, element| any.tap { |myself| myself[yield element] << element } }
  end

  def tally
    reduce(Hash.new(0)) { |any, element| any.tap { |myself| myself[element] += 1 } }
  end
end

class Array
  def my_zip(*args)
    out = Array.new(size) { [] }
    count.times do |i|
      out[i] << self[i]
      args.my_each { |arg| out[i] << arg[i] }
    end
    out.my_each { |element| yield element } && nil if block_given?
    out
  end
end
