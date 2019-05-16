require 'byebug'
module Enumerable
  # eachを独自実装しよう！！！
  # forとかwhileでやってみてね。
  def my_each
    index = 0
    while self.size > index do
      yield self[index]

      index += 1
    end
  end

  # 下記問題、eachの使用は禁止。my_eachとかreduceはいいよん
  def my_find(arg = nil, &block)
    self.my_each do |element|
      yield element
    end
  end

  def my_map(arg); end

  def my_each_with_object(arg); end

  def my_group_by(arg); end

  def tally; end
end

class Array
  def my_zip(*args); end
end
