class VendorsController < ApplicationController
  def show
    @facade = VendorFacade.new(params)
  end
end