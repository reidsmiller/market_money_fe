require 'rails_helper'

RSpec.describe 'Market index page' do
  describe 'As a visitor when I visit /markets' do
    before(:each) do
      visit '/markets'
    end

    it 'I see all markets listed with name, city, and state', :vcr do
      markets = MarketsFacade.new.markets
      table = find('table')
      expect(table).to have_css('th', text: 'Name')
      expect(table).to have_css('th', text: 'City')
      expect(table).to have_css('th', text: 'State')

      within "#market_#{markets.first.id}" do
        expect(page).to have_content(markets.first.name)
        expect(page).to have_content(markets.first.city)
        expect(page).to have_content(markets.first.state)
        expect(page).to have_button('More Info')
      end
    end

    it 'I can click on a more info button to go to that market show page', :vcr do
      markets = MarketsFacade.new.markets

      within "#market_#{markets.first.id}" do
        click_button('More Info')
      end

      expect(current_path).to eq("/markets/#{markets.first.id}")
    end
  end
end