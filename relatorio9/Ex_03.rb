# Cenário: Em Steins;Gate, um grupo de amigos mantém o Laboratório de Gadgets do Futuro, um
# pequeno laboratório de invenções em Tóquio. A invenção mais importante do grupo é o PhoneWave,
# um micro-ondas ligado a um celular que, por acidente, envia mensagens de texto para o passado. O
# aparelho foi montado dentro do laboratório e só existe nele (composição). Os membros do
# laboratório já eram pessoas comuns antes de entrar no grupo e continuam existindo fora dele
# (agregação).
# Tarefa:
# 1. Crie a classe PhoneWave, com o método enviar_dmail(mensagem), que imprime a mensagem e
#    avisa que ela foi enviada para o passado.
# 2. Crie a classe MembroDoLab, cujo initialize recebe numero (o número de Lab Mem) e nome, os
#    dois com attr_reader.
# 3. Crie a classe LaboratorioDeGadgets, cujo initialize não recebe parâmetros e:
#    cria um PhoneWave dentro dele, guardado em @phonewave;
#    cria o array @membros vazio.
# 4. Em LaboratorioDeGadgets, crie os métodos:
#    admitir(membro), que adiciona um membro já criado ao @membros e imprime o número e o
#    nome dele;
#    experimento(mensagem), que imprime, com .each, o número e o nome de cada membro
#    presente e depois envia a mensagem pelo enviar_dmail do PhoneWave guardado em
#    @phonewave.
# 5. No main, crie dois membros antes do laboratório, à sua escolha. Depois, crie o laboratório, admita
#    os dois e chame experimento(...) com uma mensagem à sua escolha.
# 6. Explique, em um comentário no código, o que é composição e o que é agregação no seu
#    programa.


class PhoneWave
  def enviar_dmail(mensagem)
    puts "\nPhoneWave aquecendo..."
    puts "Mensagem: #{mensagem}"
    puts "D-Mail enviado para o passado com sucesso!"
  end
end


class MembroDoLab
  attr_reader :numero, :nome

  def initialize(numero, nome)
    @numero = numero
    @nome = nome
  end
end


# Composição: o LaboratorioDeGadgets cria o próprio PhoneWave dentro do initialize
# (@phonewave = PhoneWave.new). O aparelho pertence só a esse laboratório: ninguém fora
# dele tem acesso ao PhoneWave, e ele deixa de existir junto com o laboratório.
# Agregação: o laboratório não cria os membros, ele só recebe membros prontos no
# admitir. Itaru e Kurisu são criados antes do laboratório, e o @membros guarda só
# uma referência para eles, então os dois continuam existindo fora do laboratório.
class LaboratorioDeGadgets
  def initialize
    @phonewave = PhoneWave.new
    @membros = []
  end

  def admitir(membro)
    @membros << membro
    puts "Novo integrante: Lab Mem #{membro.numero} - #{membro.nome}"
  end

  def experimento(mensagem)
    puts "\n=== Experimento com #{@membros.length} membros presentes ==="
    @membros.each { |membro| puts "Lab Mem #{membro.numero} - #{membro.nome}" }
    @phonewave.enviar_dmail(mensagem)
  end
end


puts "=== Akihabara, Laboratorio de Gadgets do Futuro ==="

daru = MembroDoLab.new(3, "Itaru Hashida")
kurisu = MembroDoLab.new(4, "Kurisu Makise")

lab = LaboratorioDeGadgets.new

lab.admitir(daru)
lab.admitir(kurisu)

lab.experimento("Nao confie no resultado da loteria de amanha.")
