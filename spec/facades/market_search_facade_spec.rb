require 'rails_helper'

RSpec.describe MarketSearchFacade do
  it 'returns a market and its vendors', :vcr do
    markets = MarketsFacade.new.markets
    expect(MarketSearchFacade.new({ id: markets.first.id }).market).to be_a(Market)
    expect(MarketSearchFacade.new({ id: markets.first.id }).market_vendors).to be_an(Array)
    expect(MarketSearchFacade.new({ id: markets.first.id }).market_vendors.first).to be_a(Vendor)
  end
end