require 'rails_helper'

RSpec.describe MarketsFacade do
  it 'returns a list of markets', :vcr do
    expect(MarketsFacade.new.markets).to be_an(Array)
    expect(MarketsFacade.new.markets.first).to be_a(Market)
  end
end