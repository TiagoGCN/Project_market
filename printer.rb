

class Printer
    attr_accessor :data
   
  def paper_printer
   @data.impressora
  end

  def change_message
    "Troco: R$#{"%.2f" % @data.change}"
  end
  
  def total_message
    "Total a pagar:----------------- R$#{"%.2f" % @data.total}"
  end

  def initialize(data)
    @data = data
  end
end

