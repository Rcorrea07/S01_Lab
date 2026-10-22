module Depoente
  def depor
    raise NotImplementedError
  end
end

module Detivel
  def ser_detido
    puts "#{nome} foi levado pela Scotland Yard."
  end
end

class Envolvido
  attr_reader :nome

  def initialize(nome)
    @nome = nome
  end
end

class TestemunhaOcular < Envolvido
  include Depoente

  def depor
    puts "#{nome} diz que viu um homem de casaco escuro saindo pela janela."
  end
end

class SuspeitoDoCrime < Envolvido
  include Depoente
  include Detivel

  def depor
    puts "#{nome} afirma que estava no teatro durante o crime."
  end
end

class Investigacao
  def initialize(caso)
    @caso = caso
    @envolvidos = []
  end

  def registrar(envolvido)
    @envolvidos << envolvido
  end

  def ouvir_todos
    puts "\n--- Caso: #{@caso} ---"
    @envolvidos.each do |e|
      e.depor
    end
  end

  def acionar_scotland_yard
    puts "\n--- Scotland Yard ---"
    detidos = @envolvidos.select { |e| e.respond_to?(:ser_detido) }
    detidos.each do |d|
      d.ser_detido
    end
  end
end

testemunha = TestemunhaOcular.new("Sra. Hudson")
suspeito1 = SuspeitoDoCrime.new("Lord Blackwood")
suspeito2 = SuspeitoDoCrime.new("Irene Adler")

investigacao = Investigacao.new("O Mistério da Baker Street")

investigacao.registrar(testemunha)
investigacao.registrar(suspeito1)
investigacao.registrar(suspeito2)

investigacao.ouvir_todos
investigacao.acionar_scotland_yard
