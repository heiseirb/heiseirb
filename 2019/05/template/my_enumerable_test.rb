require 'minitest/autorun'
require_relative 'my_enumerable'

class MyEnumerableTest < MiniTest::Test
  # https://ref.xaio.jp/ruby/classes/enumerable/find
  def test_find
    skip
    assert_equal 35, (1..100).find {|i| i % 5 == 0 && i % 7 == 0 }
    not_found = -> { 'NOT FOUND' }
    assert_equal 35, (1..100).find(not_found) {|i| i % 5 == 0 && i % 7 == 0 }
  end

  # https://ref.xaio.jp/ruby/classes/enumerable/collect
  # minitestが壊れるので勇気あるものは挑め
  def test_map
    skip
    assert_equal [1, 4, 9], [1, 2, 3].map {|i| i ** 2 } 
    assert_equal ['1', '2', '3'], [1, 2, 3].map(&:to_s)
  end

  # https://ref.xaio.jp/ruby/classes/array/zip
  def test_zip
    skip
    arr1 = [1, 2, 3]
    arr2 = [4, 5]
    arr3 = [6, 7, 8, 9]
    assert_equal [[1, 4, 6], [2, 5, 7], [3, nil, 8]], arr1.zip(arr2, arr3)
    assert_nil arr1.zip(arr2, arr3) {|a| a.join(":") }

    skip
    # ブロック渡したときの動きはちょいとめんどい
    # テスト汚いのごめんなさい
    str = ''
    arr1.zip(arr2, arr3) {|a| str += "・#{a.join(":")}" }
    assert_equal '・1:4:6・2:5:7・3::8', str
  end

  # https://ref.xaio.jp/ruby/classes/enumerable/each_with_object
  def test_each_with_object
    skip
    assert_equal [2, 4, 6, 8, 10], (1..5).each_with_object([]) {|i, a| a << i * 2 }
    assert_equal 'Hello, ALICE', %w(a li ce).each_with_object('Hello, ') {|str, memo| memo << str.upcase }
  end

  # https://ref.xaio.jp/ruby/classes/enumerable/group_by
  # minitestが壊れるので勇気あるものは挑め
  def test_group_by
    skip
    assert_equal({0 => [0], 1 => [1], 2 => [2]}, [0, 1, 2].group_by(&:itself))
    assert_equal({0 => [3, 6], 1 => [1, 4], 2 => [2, 5]}, (1..6).group_by {|i| i % 3})
  end

  # https://medium.com/@baweaver/ruby-2-7-enumerable-tally-a706a5fb11ea
  # 2.7.0で出るやつだよ
  def test_tally
    skip
    assert_equal({1 => 3, 10 => 2, 100 => 4}, [1, 10, 100, 100, 10, 1, 100, 1, 100].tally)
  end
end
