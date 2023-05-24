require 'rails_helper'

RSpec.describe 'Market index page' do
  describe 'As a visitor when I visit /markets', :vcr do
    before(:each) do
      visit '/markets'
    end

    it 'I see all markets listed with name, city, and state' do
      table = find('table')
      expect(table).to have_content('Name')
      expect(table).to have_content('City')
      expect(table).to have_content('State')

      expect(table).to be_visible
      expect(table).to have_css('tr', count: 3)
      expect(table).to have_css('td', count: 4)
    end
  end
end