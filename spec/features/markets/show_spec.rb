require 'rails_helper'

RSpec.describe 'Market show page', :vcr do
  before(:each) do
    markets = MarketsFacade.new.markets
    @market = markets.first
    @vendors = MarketSearchFacade.new({ id: @market.id }).market_vendors
    visit market_path(@market.id)
  end

  it 'I see the market name and address' do
    expect(page).to have_content(@market.name)
    expect(page).to have_css('.street')
    expect(page).to have_content(@market.city)
    expect(page).to have_content(@market.state)
    expect(page).to have_content(@market.zip)
  end

  it 'I see a list of vendors that sell at this market' do
    expect(page).to have_content('Vendors at this Market:')
    expect(page).to have_link(@vendors.first.name)
    expect(page).to have_link(@vendors.last.name)
  end

  it 'I can click on a vendors name to go to their show page'do
    click_link(@vendors.first.name)
    expect(current_path).to eq(vendor_path(@vendors.first.id))
  end
end