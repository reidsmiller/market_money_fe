require 'rails_helper'

RSpec.describe MarketMoneyService do
  context '#all_markets' do
    it 'returns a list of all markets', :vcr do
      search = MarketMoneyService.new.all_markets
      expect(search).to be_a(Hash)
      expect(search[:data]).to be_an(Array)
      market_data = search[:data].first

      expect(market_data).to have_key(:id)
      expect(market_data[:id]).to be_a(String)

      expect(market_data).to have_key(:type)
      expect(market_data[:type]).to be_a(String)

      expect(market_data).to have_key(:attributes)
      expect(market_data[:attributes]).to be_a(Hash)

      expect(market_data[:attributes]).to have_key(:name)
      expect(market_data[:attributes][:name]).to be_a(String)

      expect(market_data[:attributes]).to have_key(:street)
      expect(market_data[:attributes][:street]).to be_a(String)

      expect(market_data[:attributes]).to have_key(:city)
      expect(market_data[:attributes][:city]).to be_a(String)

      expect(market_data[:attributes]).to have_key(:county)
      expect(market_data[:attributes][:county]).to be_a(String)

      expect(market_data[:attributes]).to have_key(:state)
      expect(market_data[:attributes][:state]).to be_a(String)

      expect(market_data[:attributes]).to have_key(:zip)
      expect(market_data[:attributes][:zip]).to be_a(String)

      expect(market_data[:attributes]).to have_key(:lat)
      expect(market_data[:attributes][:lat]).to be_a(String)

      expect(market_data[:attributes]).to have_key(:lon)
      expect(market_data[:attributes][:lon]).to be_a(String)

      expect(market_data[:attributes]).to have_key(:vendor_count)
      expect(market_data[:attributes][:vendor_count]).to be_an(Integer)
    end
  end

  context '#market' do
    it 'returns a single markets details', :vcr do
      markets = MarketMoneyService.new.all_markets
      search = MarketMoneyService.new.market(markets[:data].first[:id])

      expect(search).to be_a(Hash)
      expect(search[:data]).to be_a(Hash)

      expect(search[:data]).to have_key(:id)
      expect(search[:data][:id]).to be_a(String)

      expect(search[:data]).to have_key(:type)
      expect(search[:data][:type]).to be_a(String)

      expect(search[:data]).to have_key(:attributes)
      expect(search[:data][:attributes]).to be_a(Hash)

      expect(search[:data][:attributes]).to have_key(:name)
      expect(search[:data][:attributes][:name]).to be_a(String)

      expect(search[:data][:attributes]).to have_key(:street)
      expect(search[:data][:attributes][:street]).to be_a(String)

      expect(search[:data][:attributes]).to have_key(:city)
      expect(search[:data][:attributes][:city]).to be_a(String)

      expect(search[:data][:attributes]).to have_key(:county)
      expect(search[:data][:attributes][:county]).to be_a(String)

      expect(search[:data][:attributes]).to have_key(:state)
      expect(search[:data][:attributes][:state]).to be_a(String)

      expect(search[:data][:attributes]).to have_key(:zip)
      expect(search[:data][:attributes][:zip]).to be_a(String)

      expect(search[:data][:attributes]).to have_key(:lat)
      expect(search[:data][:attributes][:lat]).to be_a(String)

      expect(search[:data][:attributes]).to have_key(:lon)
      expect(search[:data][:attributes][:lon]).to be_a(String)

      expect(search[:data][:attributes]).to have_key(:vendor_count)
      expect(search[:data][:attributes][:vendor_count]).to be_an(Integer)
    end
  end

  context '#market_vendors' do
    it 'returns a list of vendors for a market', :vcr do
      markets = MarketMoneyService.new.all_markets
      search = MarketMoneyService.new.market_vendors(markets[:data].first[:id])

      expect(search).to be_a(Hash)
      expect(search[:data]).to be_an(Array)
      vendor_data = search[:data].first

      expect(vendor_data).to have_key(:id)
      expect(vendor_data[:id]).to be_a(String)

      expect(vendor_data).to have_key(:type)
      expect(vendor_data[:type]).to be_a(String)

      expect(vendor_data).to have_key(:attributes)
      expect(vendor_data[:attributes]).to be_a(Hash)

      expect(vendor_data[:attributes]).to have_key(:name)
      expect(vendor_data[:attributes][:name]).to be_a(String)

      expect(vendor_data[:attributes]).to have_key(:description)
      expect(vendor_data[:attributes][:description]).to be_a(String)

      expect(vendor_data[:attributes]).to have_key(:contact_name)
      expect(vendor_data[:attributes][:contact_name]).to be_a(String)

      expect(vendor_data[:attributes]).to have_key(:contact_phone)
      expect(vendor_data[:attributes][:contact_phone]).to be_a(String)

      expect(vendor_data[:attributes]).to have_key(:credit_accepted)
      expect(vendor_data[:attributes][:credit_accepted]).to be(true).or be(false)
    end
  end
end