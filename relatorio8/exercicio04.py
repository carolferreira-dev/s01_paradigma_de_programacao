# Exercício 4: Revisão Geral (Ataque em Night City)

from abc import ABC, abstractmethod


# INTERFACE (contrato via classe abstrata)
# Python não tem interface nativa como C#, então usamos ABC + @abstractmethod
# toda classe que herdar de IUnidadeDeRede É OBRIGADA a ter executar_invasao()
class IUnidadeDeRede(ABC):

    @abstractmethod
    def executar_invasao(self):
        pass


# PARTE COMPOSTA
# o cyberdeck é implantado no corpo do netrunner, não existe sem ele
class Cyberdeck:

    def __init__(self, modelo: str):
        self.modelo = modelo


# IMPLEMENTAÇÃO COM COMPOSIÇÃO
class OperadorNetrunner(IUnidadeDeRede):

    def __init__(self, nome: str, modelo_cyberdeck: str):
        self.nome = nome
        # COMPOSIÇÃO: o Cyberdeck é criado aqui dentro, recebendo só o modelo
        self.cyberdeck = Cyberdeck(modelo_cyberdeck)

    def executar_invasao(self):
        print(f"   [Netrunner] {self.nome} conecta o cyberdeck {self.cyberdeck.modelo} "
              f"e está quebrando o gelo (ICE) de um servidor!")


# OUTRA IMPLEMENTAÇÃO DA MESMA INTERFACE
class DroneDeVigilancia(IUnidadeDeRede):

    def __init__(self, codigo: str):
        self.codigo = codigo

    def executar_invasao(self):
        print(f"   [Drone {self.codigo}] está interceptando o sinal da rede!")


# AGREGAÇÃO
# a célula recebe membros que já foram criados antes; ela não é dona deles
class CelulaHacker:

    def __init__(self, nome: str, membros: list[IUnidadeDeRede]):
        self.nome = nome
        self.membros = membros

    def iniciar_ataque(self):
        print(f"\n--- Célula {self.nome} iniciando ataque ---")

        # POLIMORFISMO EM AÇÃO
        # mesma chamada, cada unidade invade do seu jeito
        for membro in self.membros:
            membro.executar_invasao()


if __name__ == "__main__":
    print("--- Night City ---")

    netrunner = OperadorNetrunner("Lucy", "Militech Paraline")
    drone = DroneDeVigilancia("DV-077")

    celula = CelulaHacker("Edgerunners", [netrunner, drone])
    celula.iniciar_ataque()

    # TESTE DA INTERFACE
    # a linha abaixo dá erro:
    # TypeError: Can't instantiate abstract class IUnidadeDeRede without an
    # implementation for abstract method 'executar_invasao'
    # classe abstrata é só um contrato, não dá pra criar objeto dela diretamente
    # unidade = IUnidadeDeRede()
