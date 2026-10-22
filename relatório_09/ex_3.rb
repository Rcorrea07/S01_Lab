class PhoneWave
  def enviar_dmail(mensagem)
    puts "D-Mail: #{mensagem}"
    puts "Mensagem enviada para o passado!"
  end
end

class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end

class LaboratorioDeGadgets
  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Lab Mem #{membro.numero}: #{membro.nome} foi admitido."
  end

  def experimento(mensagem)
    puts "\nMembros presentes:"
    @membros.each do |m|
      puts "Lab Mem #{m.numero}: #{m.nome}"
    end
    @phonewave.enviar_dmail(mensagem)
  end
end

okabe = MembroDoLab.new(1, "Rintaro Okabe")
mayuri = MembroDoLab.new(2, "Mayuri Shiina")

lab = LaboratorioDeGadgets.new

lab.admitir(okabe)
lab.admitir(mayuri)

lab.experimento("El Psy Kongroo")

# Composição: o PhoneWave é criado dentro do initialize do laboratório, então só existe nele e some junto com ele.
# Agregação: Okabe e Mayuri são criados fora do laboratório e só são guardados no array, continuando a existir mesmo sem o laboratório.
