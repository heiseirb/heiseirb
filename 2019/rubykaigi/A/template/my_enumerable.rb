module Enumerable
  # eachを独自実装しよう！！！
  # forとかwhileでやってみてね。
  def my_each
    for i in 0...self.length
      yield self[i]
    end
  end

  # 下記問題、eachの使用は禁止。my_eachとかreduceはいいよん
  def my_find(arg=nil)
    for item in self
      if yield item
        return item
      end
    end
    
    if arg
      arg.call
    else
      nil
    end
  end

  def my_map(arg=nil)
    result = []
    for item in self
      result << yield(item)
    end
    result
  end

  def my_each_with_object(arg); end

  def my_group_by(arg); end

  def tally; end
end

class Array
  def my_zip(*args); end
end
