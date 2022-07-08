
class Product

    attr_reader :name, :code, :price 
   
    def initialize(code, name, price)
      @code = code
      @name = name
      @price = price
    end
  end