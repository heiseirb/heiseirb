require './has_love'
describe "HasLove#find" do
  before do
    sentence = <<~'EOS'
    TEOWMZGTZKRECDSBYSUY
    IIXIGGXYZLOVEETSFZNH
    JELOVEQHYKFEUEQBNQZO
    PQJXLOVEBFHMJUCTASAY
    FIGZOZABPAQGQZEMDVOG
    AXSMVWFSPFSUPALEZWFQ
    YXXQEDCBYTHBQCOKYSEP
    ZWLPXHVYFAPDYOVYRZAR
    SJSLLHVMZCDLOVEXWLOV
    NPGNDBMWAOPVXIGLPDXR
    EOS
    @has_love = HasLove.new(sentence: sentence)
  end
  it { expect(@has_love.find 1, 3, 1, 6).to eq(true) }
  it { expect(@has_love.find 2, 2, 10, 14).to eq(true) }
  it { expect(@has_love.find 6, 9, 15, 15).to eq(true) }
  it { expect(@has_love.find 9, 9, 12, 15).to eq( true) }
  it { expect(@has_love.find 6, 7, 1, 20).to eq( false ) }
  it { expect(@has_love.find 4, 8, 6, 20).to eq( false ) }
  it { expect(@has_love.find 1, 8, 11, 20).to eq( false ) }
  it { expect{@has_love.find 1, 8, 11, 22}.to raise_error(OutOfRangeError)}
  it { expect{@has_love.find 9, 8, 11, 1}.to raise_error(InvalidRangeError)}
end
