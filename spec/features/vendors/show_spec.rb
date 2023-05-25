require 'rails_helper'

RSpec.describe 'Vendor show page' do
  before(:each) do
    markets = MarketsFacade.new.markets
    market = markets.first
    vendors = MarketSearchFacade.new({ id: market.id }).market_vendors
    @vendor = VendorFacade.new({ id: vendors.first.id }).vendor
    visit vendor_path(@vendor.id)
  end

  it 'I see the vendors details', :vcr do
    expect(page).to have_content(@vendor.name)

    within '.contact_info' do
      expect(page).to have_content('Contact Info:')
      expect(page).to have_content('Name:')
      expect(page).to have_content(@vendor.contact_name)
      expect(page).to have_content('Phone:')
      expect(page).to have_content(@vendor.contact_phone)
    end
    within '.credit_info' do
      expect(page).to have_content('Credit Accepted?:')
      expect(page).to have_content('Yes').or have_content('No')
    end

    expect(page).to have_content('Description:')
    expect(page).to have_content(@vendor.description)
  end
end