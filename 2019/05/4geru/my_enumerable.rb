module Enumerable
  # eachを独自実装しよう！！！
  # forとかwhileでやってみてね。
  def my_each(&block)
    for v in self
      block.call(v)
    end
  end

  # 下記問題、eachの使用は禁止。my_eachとかreduceはいいよん
  def my_find(arg); end

  def my_map(&arg)
    arr = []
    for v in self
      arr << arg.call(v)
    end
    arr
  end

  def my_each_with_object(arg); end

  def my_group_by(arg); end

  def tally(&block)
    hash = {}
    for v in self
      hash[v] = if hash[v].nil?
                  1
                else
                  hash[v] + 1
                end
    end
    hash
  end

end

class Array
  def my_zip(*args); end
end