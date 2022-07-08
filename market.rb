
class Market
  attr_accessor :total, :imput, :troco, :valor, :impressora

  def initialize(data) 
    @impressora = []
    @total = 0
    find_product(data)
  end

  def imput_digital_code
    puts "Registre o código:"
    @imput = gets.chomp
  end

  def imput_troco
    puts "qual o valor recebido:"
    @valor = gets.to_i
  end

  def to_printer(product)
    @impressora << "Produto: #{product.name} --------------- Valor: R$#{"%.2f" %product.price}"
  end

  def screen_print_message(product)
    puts "Produto: #{product.name} --------------- Valor: R$#{"%.2f" %product.price}"
  end

  def over?(imput)
    return true if @imput.to_s == "end"
  end

  def troco_calculo(total)
      @troco = imput_troco - total
  end

  def screen_total_message(total)
    puts "Total = R$#{"%.2f"% @total}"
  end

  def find_product(data)
   
    loop do
      imput_digital_code
      data.each do |product|
        if @imput.to_i == product.code
          screen_print_message(product)
          to_printer(product)
          @total += product.price
        end
      end
      break if over?(@imput)
    end 
    screen_total_message(total)
    troco_calculo(total)
  end
end

