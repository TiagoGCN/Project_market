
class Market
  attr_accessor :total, :imput, :change, :valor, :impressora, :discount_parameter, :impressora_discount, :to_print_product_number, :screen_total

  def initialize(data)
    @discount_parameter = []
    @impressora = []
    @impressora_discount = []
    @total = 0
    @screen_total = 0
    @i_discount = -1
    @to_print_product_number = 0
    find_product(data)
  end

  def discount_condition(product, imput)
    @to_print_product_number +=1
    screen_print_message(product)
    to_printer(product)
    @total += product.price
    i = 0
    discount_parameter.each do |code|
      if code == @imput.to_i
        i += 1
      end
    end

    if product.discount == product.price
      @screen_total += product.price
      screen_total_message
    elsif i == 3 
      @screen_total += product.discount 
      @screen_total += (-(product.price - product.discount)*(i-1))
      screen_discount_print_message(product, i)
      to_printer_discount(product, i)
      screen_total_message
    elsif i > 3
      @screen_total += product.discount 
      screen_discount_print_message(product, i)
      to_printer_discount(product, i)
      screen_total_message
    else
      @screen_total += product.price
      screen_total_message
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
    @impressora << "#{@to_print_product_number} Produto: #{product.name} --------------- Valor: R$#{"%.2f" %product.price}"
  end
  
  def parameter_to_printer_discount(product, i)
    (@i_discount+1).times do |position|
      puts @i_discount
      if @impressora_discount[position - 1][:code] == product.code
        @impressora_discount[position - 1][:discount_value] = (-(product.price - product.discount)*i)
        return true
      else
        next
      end
    end
    return false
  end

  def to_printer_discount(product, i)
    if @impressora_discount == []
      @impressora_discount << {code: product.code, name: product.name, discount_value: (-(product.price - product.discount)*i)}
      @i_discount += 1
    elsif parameter_to_printer_discount(product, i)
    else
      @impressora_discount << {code: product.code, name: product.name, discount_value: (-(product.price - product.discount)*i)}
      @i_discount += 1
    end
  end 

  def screen_discount_print_message(product, i)
    puts "        Desconto: #{product.name} --------------- Valor: R$#{"%.2f" % (-(product.price - product.discount)*i)}"
  end

  def screen_print_message(product)
    puts "#{@to_print_product_number} Produto: #{product.name} --------------- Valor: R$#{"%.2f" %product.price}"
  end

  def over?(imput)
    return true if @imput.to_s == "end"
  end

  def change_calculo(total)
      @change = imput_change - screen_total
  end

  def screen_total_message
    puts "Total = R$#{"%.2f"% screen_total}"
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
    change_calculo(total)
  end
end


