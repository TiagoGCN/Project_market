
class Discount_register
  attr_accessor :product, :code
  
  def code_register
    puts 'Digite o código do produto que deseja dar o disconto:'
    @code = gets.to_i
  end
  
  def finding_product
    @product.each do |product|
      if product.code == @code
        product.discount = 14.50
        # puts "Produto: #{product.name}.............Valor: R$#{'%.2f' % product.discount}"
      end     
    end
  end
    
  def initialize(data)
    @product = data
    code_register
    finding_product
  end
end