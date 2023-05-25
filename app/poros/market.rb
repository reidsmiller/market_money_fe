class Market
  attr_reader :id, :name, :city, :state

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @city = data[:attributes][:city]
    @state = data[:attributes][:state]
  end
end