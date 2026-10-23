# Cenário: Sherlock Holmes é um detetive que mora na Baker Street, em Londres. Ao
# investigar um crime, ele ouve todos os envolvidos, e cada um presta depoimento do
# seu jeito: a testemunha ocular conta o que viu e o suspeito apresenta o seu álibi. No
# fim, Holmes entrega à Scotland Yard quem pode ser detido, e só os suspeitos podem.
# Tarefa:
# 1. Módulos: crie dois módulos:
#    Depoente (contrato), com o método depor, cujo corpo é apenas um raise
#    NotImplementedError;
#    Detivel (implementação pronta), com o método ser_detido, que imprime o
#    nome da pessoa e que ela foi levada pela Scotland Yard. O nome vem do
#    attr_reader da classe que incluir o módulo.
# 2. Crie a classe base Envolvido, cujo initialize recebe nome (com attr_reader). Ela não
#    inclui nenhum módulo.
# 3. Crie a classe TestemunhaOcular, que herda de Envolvido e inclui apenas
#    Depoente. Implemente depor para imprimir o nome e o que a testemunha viu
#    (texto à sua escolha).
# 4. Crie a classe SuspeitoDoCrime, que herda de Envolvido e inclui Depoente e
#    Detivel. Implemente depor para imprimir o nome e o álibi do suspeito (texto à sua
#    escolha).
# 5. Agregação: crie a classe Investigacao, cujo initialize recebe caso (o nome do caso)
#    e cria o array @envolvidos vazio, com os métodos:
#    registrar(envolvido), que adiciona um envolvido já criado ao array;
#    ouvir_todos, que imprime o nome do caso e chama depor de cada envolvido
#    com .each (polimorfismo);
#    acionar_scotland_yard, que usa .select com respond_to?(:ser_detido) para
#    separar quem pode ser detido e chama ser_detido de cada um deles.
# 6. Na main, crie uma testemunha ocular e dois suspeitos, à sua escolha, antes da
#    investigação. Depois, crie a investigação com um caso à sua escolha, registre os
#    três e chame ouvir_todos e acionar_scotland_yard.


module Depoente
  def depor
    raise NotImplementedError, "#{self.class} deve implementar depor"
  end
end


module Detivel
  def ser_detido
    puts "Scotland Yard: #{nome} foi levado para a delegacia."
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
    puts "#{nome} conta o que viu: um homem deixou cair um ganso e um chapeu na rua."
  end
end


class SuspeitoDoCrime < Envolvido
  include Depoente
  include Detivel

  attr_reader :alibi

  def initialize(nome, alibi)
    super(nome)
    @alibi = alibi
  end

  def depor
    puts "#{nome} apresenta o seu alibi: #{alibi}"
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
    puts "\n=== Holmes investiga: #{@caso} ==="
    @envolvidos.each { |envolvido| envolvido.depor }
  end

  def acionar_scotland_yard
    puts "\n=== Holmes chama a Scotland Yard ==="
    suspeitos = @envolvidos.select { |envolvido| envolvido.respond_to?(:ser_detido) }

    suspeitos.each do |suspeito|
      suspeito.ser_detido
    end
  end
end


puts "=== Baker Street, 221B ==="

peterson = TestemunhaOcular.new("Peterson")
ryder = SuspeitoDoCrime.new("James Ryder", "Eu estava trabalhando no Hotel Cosmopolitan.")
baker = SuspeitoDoCrime.new("Henry Baker", "Eu estava bebendo na taverna Alpha.")

caso = Investigacao.new("O Carbunculo Azul")

[peterson, ryder, baker].each { |pessoa| caso.registrar(pessoa) }

caso.ouvir_todos
caso.acionar_scotland_yard
