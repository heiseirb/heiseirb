require './to_biggest_num'
describe "Array#to_biggest_num" do
  it { expect([1, 2, 3].to_biggest_num).to eq(321) }
  it { expect([50, 2, 1, 9].to_biggest_num).to eq(95021) }
  it { expect{ [50, 2, 1, 'string'].to_biggest_num }.to raise_error(NecessaryValueError)
  it { expect{ [50, 2, [123], 3].to_biggest_num }.to raise_error(NecessaryValueError)
  it { expect{ [50, {key: 'value'}, 123, 3].to_biggest_num }.to raise_error(NecessaryValueError)
  it { expect([0, 0, 0, 9].to_biggest_num).to eq(9000) }
  it { expect([9, 3000, 9, 9].to_biggest_num).to eq(3000999) }
  it { expect([0, 0.001, 9, 3].to_biggest_num).to eq(9300.001) }
  it { expect{ [0, -0.001, 9, 3].to_biggest_num }.to raise_error(NecessaryValueError)
end
