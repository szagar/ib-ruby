require 'model_helper'

describe IB::ContractDetail,

         :props =>
             {:market_name => 'AAPL',
              :trading_class => 'AAPL',
              :min_tick => 0.01,
              :price_magnifier => 1,
              :order_types => 'ACTIVETIM,ADJUST,ALERT,ALGO,ALLOC,AON,AVGCOST,BASKET,COND,CONDORDER,DAY,DEACT,DEACTDIS,DEACTEOD,FOK,GAT,GTC,GTD,GTT,HID,ICE,IOC,LIT,LMT,MIT,MKT,MTL,NONALGO,OCA,PAON,POSTONLY,RELSTK,SCALE,SCALERST,SMARTSTG,STP,STPLMT,TRAIL,TRAILLIT,TRAILLMT,TRAILMIT,VOLAT,WHATIF,',
              :valid_exchanges => 'SMART,AMEX,BATS,BOX,CBOE,CBOE2,IBSX,ISE,MIBSX,NASDAQOM,PHLX,PSE', #   The list of exchanges this contract is traded on.
              :under_con_id => 265598,
              :long_name => 'APPLE INC',
              :contract_month => '201301',
              :industry => 'Technology',
              :category => 'Computers',
              :subcategory => 'Computers',
              :time_zone => 'EST',
              :trading_hours => '20120422:0930-1600;20120423:0930-1600',
              :liquid_hours => '20120422:0930-1600;20120423:0930-1600',
              :ev_rule => 'aussieBond:YearsToExpiration=3',
              :ev_multiplier => 0.5,
             },

         :human =>/ContractDetail: callable: false category: Computers contract_month: 201301 convertible: false coupon: 0.0 created_at: .* industry: Technology liquid_hours: 20120422:0930-1600;20120423:0930-1600 long_name: APPLE INC market_name: AAPL min_tick: 0.01 next_option_partial: false order_types: ACTIVETIM,ADJUST,ALERT,ALGO,ALLOC,AON,AVGCOST,BASKET,COND,CONDORDER,DAY,DEACT,DEACTDIS,DEACTEOD,FOK,GAT,GTC,GTD,GTT,HID,ICE,IOC,LIT,LMT,MIT,MKT,MTL,NONALGO,OCA,PAON,POSTONLY,RELSTK,SCALE,SCALERST,SMARTSTG,STP,STPLMT,TRAIL,TRAILLIT,TRAILLMT,TRAILMIT,VOLAT,WHATIF, price_magnifier: 1 puttable: false .*subcategory: Computers time_zone: EST trading_class: AAPL trading_hours: 20120422:0930-1600;20120423:0930-1600 under_con_id: 265598 updated_at: .* valid_exchanges: SMART,AMEX,BATS,BOX,CBOE,CBOE2,IBSX,ISE,MIBSX,NASDAQOM,PHLX,PSE>/,

         :errors =>
             {:time_zone => ['should be XXX'],
             },

         :assigns =>
             {[:under_con_id, :min_tick, :coupon] => {123 => 123},
              [:callable, :puttable, :convertible, :next_option_partial] => boolean_assigns,
             },

         :aliases =>
             {[:contract, :summary] => {IB::Contract.new => IB::Contract.new}
             } do

  it_behaves_like 'Model with invalid defaults'
  it_behaves_like 'Self-equal Model'

  it 'inherited equality method works (important for IB::Base derived tableless models)' do
    IB::ContractDetail.new(props).should == IB::ContractDetail.new(props)
  end
end # describe IB::ContractDetail
