class VendorFacade
  def initialize(params)
    @params = params
  end

  def vendor
    @vendor = Vendor.new(vendor_data[:data])
  end

  private

  def service
    @_service ||= MarketMoneyService.new
  end

  def vendor_data
    @_vendor_data ||= service.vendor(@params[:id])
  end
end