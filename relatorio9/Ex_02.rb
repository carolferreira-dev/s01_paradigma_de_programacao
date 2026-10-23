# Cenário: Em Your Lie in April, jovens músicos de música clássica se apresentam em
# competições e concertos de gala. Em uma apresentação, cada instrumentista tem um papel:
# o solista toca a melodia principal e o acompanhador toca a base, seguindo o ritmo do solista.
# Todos são conduzidos pelo regente.
# Tarefa:
# 1. Abstração: crie a classe base Instrumentista, cujo initialize recebe nome e instrumento
#    (os dois com attr_reader). Crie também o método interpretar(peca), cujo corpo é apenas
#    um raise NotImplementedError, com uma mensagem à sua escolha.
# 2. Crie a classe filha Solista, sem initialize próprio (ela usa o do pai), e sobrescreva
#    interpretar(peca) para imprimir o nome, o instrumento e a peça, dizendo que ele conduz
#    a melodia principal.
# 3. Crie a classe filha Acompanhador, também sem initialize próprio, e sobrescreva
#    interpretar(peca) para imprimir o nome, o instrumento e a peça, dizendo que ele
#    acompanha o ritmo do solista.
# 4. Crie a classe Regente, cujo initialize recebe nome e cria o array @orquestra vazio, com os
#    métodos:
#    convocar(instrumentista), que adiciona o instrumentista ao @orquestra com <<;
#    reger(peca), que imprime o nome do regente e a peça e, com .each, chama
#    interpretar(peca) de cada instrumentista;
#    escalacao, que usa .map para retornar um novo array de textos, um por
#    instrumentista, com o nome da classe dele (use .class) e o seu nome.
# 5. Na main, crie um Solista, um Acompanhador e um Regente, à sua escolha. Convoque os
#    dois instrumentistas, chame reger(...) com uma peça à sua escolha e imprima, com .each,
#    cada texto do array retornado por escalacao.
# 6. Crie um Instrumentista diretamente e, na linha seguinte, chame interpretar(...) nele.
#    Observe que o objeto é criado, mas a chamada gera um erro. Depois, transforme a linha
#    da chamada em comentário (#) para o programa voltar a rodar.


class Instrumentista
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def interpretar(peca)
    raise NotImplementedError, "Cada instrumentista interpreta a peca do seu jeito"
  end
end


class Solista < Instrumentista
  def interpretar(peca)
    puts "[Solista] #{nome} toca #{peca} no #{instrumento} e conduz a melodia principal."
  end
end


class Acompanhador < Instrumentista
  def interpretar(peca)
    puts "[Acompanhador] #{nome} toca #{peca} no #{instrumento} e acompanha o ritmo do solista."
  end
end


class Regente
  attr_reader :nome

  def initialize(nome)
    @nome = nome
    @orquestra = []
  end

  def convocar(instrumentista)
    @orquestra << instrumentista
    puts "#{instrumentista.nome} entrou para a orquestra."
  end

  def reger(peca)
    puts "\n=== Regencia de #{nome}: #{peca} ==="
    @orquestra.each { |musico| musico.interpretar(peca) }
  end

  def escalacao
    @orquestra.map do |musico|
      "#{musico.nome} -> #{musico.class}"
    end
  end
end


puts "=== Gala de Piano a Quatro Maos ==="

emi = Solista.new("Emi Igawa", "piano")
nagi = Acompanhador.new("Nagi Aiza", "piano")
hiroko = Regente.new("Hiroko Seto")

hiroko.convocar(emi)
hiroko.convocar(nagi)

hiroko.reger("Danca Hungara n. 5")

puts "\n=== Escalacao da noite ==="
hiroko.escalacao.each { |linha| puts linha }

kousei = Instrumentista.new("Kousei Arima", "piano")
# kousei.interpretar("Danca Hungara n. 5")
