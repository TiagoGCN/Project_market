
class Product
  attr_accessor :name, :code, :price, :discount
   
  def initialize(code, name, price)
    @code = code
    @name = name
    @price = price
    @discount = price
  end
end


 

