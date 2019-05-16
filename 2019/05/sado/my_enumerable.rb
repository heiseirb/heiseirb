module Enumerable
  # eachを独自実装しよう！！！
  # forとかwhileでやってみてね。
  def my_each(&block );
    i = 0;
    while i < self.length do
      ele = self[i]
      yield(ele)
      i += 1
    end
  end

  # 下記問題、eachの使用は禁止。my_eachとかreduceはいいよん
  def my_find(arg); end

  def my_map(&block);
    i = 0;
    arr = []
    while i < self.length do
      ele = self[i]
      arr << yield(ele)
      i += 1
    end
    arr
  end

  def my_each_with_object(arg); end

  def my_group_by(arg); end

  def tally;
    i = 0;
    hash = {};
    while i < self.length do
      ele =  self[i]
      if hash.has_key?(ele)
        hash[ele] += 1
      else
        hash[ele] = 1
      end
      i += 1
    end
    hash
  end
end

class Array
  def my_zip(*args); end
end
