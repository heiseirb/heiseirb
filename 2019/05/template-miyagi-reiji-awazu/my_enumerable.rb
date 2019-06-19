module Enumerable
  def my_each
    for i in self do
      yield i
    end
  end

  # 下記問題、eachの使用は禁止。my_eachとかreduceはいいよん
  def my_find(arg); end

  def my_map(arg)
    array = []
    self.my_each do |i|
      hoge = yield i end
      array << hoge
    end

    array
  end

  def my_each_with_object(arg); end

  def my_group_by(arg); end

  def tally; end
end

class Array
  def my_zip(*args); end
end
