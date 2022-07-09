require_relative "data.rb"
require_relative "product.rb"
require_relative "register.rb"
require_relative "market.rb"
require_relative "printer.rb"
require_relative "discount_register"

data = Data.data(Register.new.product_register)
disconto = Discount_register.new(data)
market = Market.new(disconto)
printer = Printer.new(market)
puts printer.paper_printer
puts "\n"
puts printer.total_message
printer.total_discount_message
puts printer.change_message