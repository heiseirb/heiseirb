require 'pry'

module Enumerable
  # eachを独自実装しよう！！！
  # forとかwhileでやってみてね。
  def my_each(*args)
    binding.pry
  end

  # 下記問題、eachの使用は禁止。my_eachとかreduceはいいよん
  def my_find(arg); end

  def my_map(arg); end

  def my_each_with_object(arg); end

  def my_group_by(arg); end

  def tally; end
end

class Array
  def my_zip(*args, &block)
  end
end

[0, 1, 2].my_each(Proc.new { |e| e * 3 })
