class CoquetelAfterlife
  attr_reader :nome

  def initialize(nome, preco)
    @nome = nome
    @_preco = preco
  end

  def preco
    @_preco
  end

  def preco=(valor)
    if valor >= 5 && valor <= 200
      @_preco = valor
    else
      puts "Preço inválido!"
    end
  end

  def ficha
    "#{nome} - #{@_preco} eurodólares"
  end
end

class DrinkDeLenda < CoquetelAfterlife
  attr_reader :lenda

  def initialize(nome, preco, lenda)
    super(nome, preco)
    @lenda = lenda
  end

  def ficha
    super + " | Em homenagem a #{lenda}"
  end
end

drinks = [
  CoquetelAfterlife.new("Brasa Vermelha", 25),
  DrinkDeLenda.new("Silverhand", 90, "Johnny Silverhand"),
  DrinkDeLenda.new("Dama de Ferro", 70, "Rogue Amendiares")
]

drinks.each do |d|
  puts d.ficha
end

drinks[1].preco = 500
drinks[1].preco = 80
puts drinks[1].ficha

# drinks[0].nome = "Outro"
