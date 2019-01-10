# -*- coding: utf-8 -*-
require './eto'
describe "Integer#to_eto" do
  it{ expect( 0.to_eto ).to eq('申') }
  it{ expect( 1.to_eto ).to eq('酉') }
  it{ expect( 2.to_eto ).to eq('戌') }
  it{expect( 3.to_eto ).to eq('亥') }
  it{expect( 4.to_eto ).to eq('子') }
  it{expect( 5.to_eto ).to eq('丑') }
  it{expect( 6.to_eto ).to eq('寅') }
  it{expect( 7.to_eto ).to eq('卯') }
  it{expect( 8.to_eto ).to eq('辰') }
  it{expect( 9.to_eto ).to eq('巳') }
  it{expect( 10.to_eto ).to eq('午') }
  it{expect( 11.to_eto ).to eq('未') }
  it{expect( 1000.to_eto ).to eq('子') }
  it{expect( 10012340.to_eto ).to eq('辰') }
  it{expect( 543.to_eto ).to eq('亥') }
  it{expect( 1234.to_eto ).to eq('午') }
  it{expect( 2019.to_eto ).to eq('亥') }
  it{expect( 3000.to_eto ).to eq('申') }
  it{expect( 1000000000.to_eto ).to eq('子') }
  it{expect( 2233.to_eto ).to eq('酉') }
end


