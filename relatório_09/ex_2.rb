class Instrumentista
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def interpretar(peca)
    raise NotImplementedError, "Cada instrumentista interpreta do seu jeito"
  end
end

class Solista < Instrumentista
  def interpretar(peca)
    puts "#{nome} toca #{peca} no #{instrumento} e conduz a melodia principal."
  end
end

class Acompanhador < Instrumentista
  def interpretar(peca)
    puts "#{nome} toca #{peca} no #{instrumento} e acompanha o ritmo do solista."
  end
end

class Regente
  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  def convocar(instrumentista)
    @orquestra << instrumentista
  end

  def reger(peca)
    puts "\nO regente #{@nome} conduz a peça #{peca}:"
    @orquestra.each do |i|
      i.interpretar(peca)
    end
  end

  def escalacao
    @orquestra.map { |i| "#{i.class} - #{i.nome}" }
  end
end

kaori = Solista.new("Kaori", "violino")
kousei = Acompanhador.new("Kousei", "piano")
regente = Regente.new("Takeshi")

regente.convocar(kaori)
regente.convocar(kousei)

regente.reger("Sonata da Primavera")

puts "\nEscalação:"
regente.escalacao.each do |texto|
  puts texto
end

reserva = Instrumentista.new("Emi", "flauta")
# reserva.interpretar("Sonata da Primavera")
