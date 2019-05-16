#require 'pry'

module Enumerable
  # eachを独自実装しよう！！！
  # forとかwhileでやってみてね。
  def my_each(&block)
    for e in self
      yield(e)
    end
  end

  # 下記問題、eachの使用は禁止。my_eachとかreduceはいいよん
  def my_find(&block)
    result = []
    self.my_each do |n|
      if yield(n)
        result <<  n
      end
    end
    if result == []
      return nil
    else
      result.first
    end
  end

  # a.my_map {|n| n*2} 2,4,6,8
  def my_map(&block)
    result = []
    for e in self
      # ちがう
      result << yield(e)
    end
    result
  end

  def my_each_with_object(arg)
  end

  def my_group_by(arg)
  end

  def tally
  end
end

class Array
  def my_zip(*args, &block)
  end
end
