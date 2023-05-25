class Vendor
  attr_reader :id, :name, :contact_name, :contact_phone, :credit_accepted, :description

  def initialize(data)
    @id = data[:id]
    @name = data[:attributes][:name]
    @contact_name = data[:attributes][:contact_name]
    @contact_phone = data[:attributes][:contact_phone]
    @credit_accepted = credit_accepted?(data[:attributes][:credit_accepted])
    @description = data[:attributes][:description]
  end

  def credit_accepted?(data)
    data == true ? 'Yes' : 'No'
  end
end