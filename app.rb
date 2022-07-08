require_relative "data.rb"
require_relative "product.rb"
require_relative "register.rb"
require_relative "market.rb"
require_relative "printer.rb"

data = Data.data(Register.new.product_register)
market = Market.new(data)
printer = Printer.new(market)
puts printer.paper_printer
puts "\n"
puts printer.total_message
puts printer.troco_message