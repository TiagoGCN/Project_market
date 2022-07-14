

class Printer
  attr_accessor :market, :total_discount
   
  def paper_printer
   @market.impressora
  end

  def change_message
    "Troco: R$#{"%.2f" % @market.change}"
  end

  def total_message
    "Valor total sem desconto: ---------------R$#{"%.2f" % @market.total}"
  end
  
  def to_pay_total_message
    "Total a pagar: ----------------- R$#{"%.2f" % (@market.total + @total_discount)}"
  end

  def total_discount_message
    @market.impressora_discount.each do |discount_product|
      puts "Desconto Total: #{discount_product[:name]} ---------- R$#{"%.2f" % (discount_product[:discount_value])}"
      @total_discount += discount_product[:discount_value]
    end
  end

  def initialize(market)
    @market = market
    @total_discount = 0
  end
end

