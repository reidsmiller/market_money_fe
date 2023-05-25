class MarketSearchFacade
  def initialize(params)
    @params = params
  end

  def market
    @market = Market.new(market_data[:data])
  end

  def market_vendors
    @vendors = market_vendors_data[:data].map do |vendor|
      Vendor.new(vendor)
    end
  end

  private

  def service
    @_service ||= MarketMoneyService.new
  end

  def market_data
    @_market_data ||= service.market(@params[:id])
  end

  def market_vendors_data
    @_market_vendors_data ||= service.market_vendors(@params[:id])
  end
end