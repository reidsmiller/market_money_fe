class MarketsFacade
  def markets
    @markets = markets_data[:data].map do |market|
      Market.new(market)
    end
  end

  private

  def service
    @_service ||= MarketMoneyService.new
  end

  def markets_data
    @_markets_data ||= service.all_markets
  end
end