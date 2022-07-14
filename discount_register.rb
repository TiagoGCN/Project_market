
class Discount_register
  attr_accessor :product, :code
  
  def code_register
    puts 'Digite o código do produto que deseja dar o disconto:'
    @code = gets.to_i
  end

  def new_product_price
    puts "Digite o novo valor do produto:"
    @new_price = gets.to_f
  end

  def ending_code_register
    puts "Deseja dar desconto em mais algum item? (Y/N)"
    @answer = gets.chomp
  end

  def over?
    return true if @answer == "N"
  end
  
  def finding_product
    loop do
      code_register
      @product.each do |product|
        if product.code == @code
          product.discount = new_product_price
        end     
      end
      ending_code_register
      break if over?
    end
  end
    
  def initialize(data)
    @product = data
    finding_product
  end
end