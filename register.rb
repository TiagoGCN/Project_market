
class Register

  def code_register
    puts "digite o codigo de barras do produto:"
      product_code = 123
  end

  def name_register
    puts "Digite o nome do produto:"
    product_name = "Arroz Dona Xepa"
  end

  def value_register
    puts "Digite o valor do produto:"
    product_price = 15.80
  end

  def over?
    puts "Adicionar um novo produto? (Y or N)"
    answer = "N"
    return true if answer == "N"
  end

  def product_register
    @list = []
    while true
      @list << Product.new(code_register, name_register, value_register)
      @list << Product.new(456, 'Biscoito Crame Cracker', 4.00)
      @list << Product.new(789, 'Feijão da Mamãe', 6.75)
      @list << Product.new(147, 'Farinha de Trigo 1kg', 3.50)
      @list << Product.new(258, 'Detergente Minuano 500ml', 1.99)
      @list << Product.new(369, 'Capa de Contra Filé 1kg', 27.29)
      break if over?
    end
    @list
  end
end

registro = Register.new


