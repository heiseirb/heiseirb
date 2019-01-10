# -*- coding: utf-8 -*-
require './kaibun'
describe "String#to_my_kaibun" do
  it{ expect( 'geasd'.to_my_kaibun ).to eq('対応してません') }
  it{ expect( 'NOON'.to_my_kaibun ).to eq('NOON') }
  it{ expect( 'NO*ON'.to_my_kaibun ).to eq('NONON' || 'NOOON') }
  it{ expect( 'NONN'.to_my_kaibun ).to eq('回文には出来ません') }
  it{ expect( 'NN'.to_my_kaibun ).to eq('NN') }
  it{ expect( '**'.to_my_kaibun ).to eq('NN' || 'OO') }
  it{ expect( 'NOON**N'.to_my_kaibun ).to eq('NOONOON') }
  it{ expect( '12341sfdgsdlkjn12'.to_my_kaibun ).to eq('対応してません') }
  it{ expect( 'NONO*'.to_my_kaibun ).to eq('NONON') }
  it{ expect( 'NON*O*'.to_my_kaibun ).to eq('NONNON') }
end


