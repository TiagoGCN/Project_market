
class Market
  attr_accessor :total, :imput, :change, :valor, :impressora, :discount_parameter

  def initialize(data)
    @discount_parameter = []
    @impressora = []
    @total = 0
    find_product(data)
  end

  def discount_condition(product, imput)
    n = 0
    discount_parameter.each do |code|
      if code == @imput.to_i
        n+=1
      end
    end

    if  product.discount == product.price
      screen_print_message(product)
      to_printer(product)
      @total += product.price
    elsif n == 3
      screen_print_message(product)
      to_printer(product)
      @total += product.price
      screen_discount_print_message(product, n)
      to_printer_discount(product, n)
      @total += ( - (product.price - product.discount)*n)
    elsif n > 3
      screen_print_message(product)
      to_printer(product)
      @total += product.price
      screen_discount_print_message(product, n)
      to_printer_discount(product, n)
      @total += (( - (product.price - product.discount)*n) - ( - (product.price - product.discount)*(n-1)))
    else
      screen_print_message(product)
      to_printer(product)
      @total += product.price
    end
  end 

  def imput_digital_code
    puts "Registre o código:"
    @imput = gets.chomp
  end

  def imput_change
    puts "qual o valor recebido:"
    @valor = gets.to_i
  end

  def to_printer(product)
    @impressora << "Produto: #{product.name} --------------- Valor: R$#{"%.2f" %product.price}"
  end

  def to_printer_discount(product, n)
    @impressora << "        Desconto total: #{product.name} --------------- Valor: R$#{"%.2f" % (-(product.price - product.discount)*n)}"
  end

  def screen_discount_print_message(product, n)
    puts "        Desconto total: #{product.name} --------------- Valor: R$#{"%.2f" % (-(product.price - product.discount)*n)}"
  end

  def screen_print_message(product)
    puts "Produto: #{product.name} --------------- Valor: R$#{"%.2f" %product.price}"
  end

  def over?(imput)
    return true if @imput.to_s == "end"
  end

  def change_calculo(total)
      @change = imput_change - total
  end

  def screen_total_message(total)
    puts "Total = R$#{"%.2f"% @total}"
  end

  def find_product(disconto)
   
    loop do
      imput_digital_code
      disconto.product.each do |product|
        if @imput.to_i == product.code
          @discount_parameter << @imput.to_i
          discount_condition(product, @imput)
        end
      end
      break if over?(@imput)
    end 
    screen_total_message(total)
    change_calculo(total)
  end
end

