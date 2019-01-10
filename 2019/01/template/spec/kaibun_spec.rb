# -*- coding: utf-8 -*-
# N O * 以外の文字列が入ってたら対応しない
# 答えが複数あるような文字列は対象外

require './kaibun'
describe "String#to_my_kaibun" do
  it{ expect( 'geasd'.to_my_kaibun ).to eq('対応してません') }
  it{ expect( 'NOON'.to_my_kaibun ).to eq('NOON') }
  it{ expect( 'NO*ON'.to_my_kaibun ).to eq('対応してません') }
  it{ expect( 'NONN'.to_my_kaibun ).to eq('回文には出来ません') }
  it{ expect( 'NN'.to_my_kaibun ).to eq('NN') }
  it{ expect( '**'.to_my_kaibun ).to eq('対応してません') }
  it{ expect( '*N'.to_my_kaibun ).to eq('NN') }
  it{ expect( 'NOON**N'.to_my_kaibun ).to eq('NOONOON') }
  it{ expect( '12341sfdgsdlkjn12'.to_my_kaibun ).to eq('対応してません') }
  it{ expect( 'NONO*'.to_my_kaibun ).to eq('NONON') }
  it{ expect( 'N*N*O*'.to_my_kaibun ).to eq('NONNON') }
end


