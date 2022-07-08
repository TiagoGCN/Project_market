

class Printer
    attr_accessor :data
   
  def paper_printer
   @data.impressora
  end

  def troco_message
    "Valor de troco: R$#{"%.2f" % @data.troco}"
  end
  
  def total_message
    "Total a pagar:----------------- R$#{"%.2f" % @data.total}"
  end

  def initialize(data)
    @data = data
  end
end

