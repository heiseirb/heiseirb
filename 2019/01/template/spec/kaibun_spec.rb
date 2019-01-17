# -*- coding: utf-8 -*-
# N O * 以外の文字列が入ってたら対応しない
# 答えが複数あるような文字列は対象外
# 回文に出来ない場合もある

require './kaibun'
describe "String#to_kaibun" do
  it {expect('geasd'.to_kaibun).to eq('対応していません')}
  it {expect('NOON'.to_kaibun).to eq('NOON')}
  it {expect('NO*ON'.to_kaibun).to eq('対応していません')}
  it {expect('NONN'.to_kaibun).to eq('回文には出来ません')}
  it {expect('NN'.to_kaibun).to eq('NN')}
  it {expect('**'.to_kaibun).to eq('対応していません')}
  it {expect('*N'.to_kaibun).to eq('NN')}
  it {expect('NOON**N'.to_kaibun).to eq('NOONOON')}
  it {expect('12341sfdgsdlkjn12'.to_kaibun).to eq('対応していません')}
  it {expect('NONO*'.to_kaibun).to eq('NONON')}
  it {expect('N*N*O*'.to_kaibun).to eq('NONNON')}
end
