class Market
  attr_reader :id, :name, :city, :state

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @street = data[:attributes][:street]
    @city = data[:attributes][:city]
    @state = data[:attributes][:state]
    @zip = data[:attributes][:zip]
  end
end