# Exercício 1: Encapsulamento e Herança (A Fogueira de Firelink)


# CLASSE BASE
# todo morto-vivo tem nome, almas e frascos de Estus
class MortoVivo:

    def __init__(self, nome: str, almas: int, estus: int):
        # ENCAPSULAMENTO - níveis de acesso em Python (por convenção)
        # nome    = público, qualquer um acessa
        # _almas  = um underline = protegido, a classe e as filhas podem usar
        # __estus = dois underlines = privado, o Python embaralha o nome (name mangling)
        self.nome = nome
        self._almas = almas
        self.__estus = estus

    # GETTER e SETTER
    # como __estus é privado, a leitura e a alteração passam por esses métodos
    def get_estus(self):
        return self.__estus

    def set_estus(self, quantidade):
        # o setter protege o objeto de ficar com um valor inválido
        if 0 <= quantidade <= 10:
            self.__estus = quantidade
        else:
            print("Quantidade de Estus inválida!")

    # retorna o texto (não imprime), assim a filha consegue reaproveitar
    def mostrar_status(self):
        return f"Morto-vivo {self.nome} | Almas: {self._almas} | Estus: {self.__estus}"


# HERANÇA
# Clerigo É UM MortoVivo e ainda tem um milagre próprio
class Clerigo(MortoVivo):

    def __init__(self, nome: str, almas: int, estus: int, milagre: str):
        # super().__init__ inicializa a parte herdada do pai
        super().__init__(nome, almas, estus)
        self.milagre = milagre

    # SOBRESCRITA (override)
    # reaproveita o texto do pai com super().mostrar_status() e acrescenta o milagre
    def mostrar_status(self):
        return f"{super().mostrar_status()} | Milagre: {self.milagre}"


if __name__ == "__main__":
    print("--- Fogueira de Firelink ---")

    petrus = Clerigo("Petrus", 2000, 5, "Cura")
    print(petrus.mostrar_status())

    print("\nTentando definir o Estus como 15...")
    petrus.set_estus(15)   # inválido, mantém o valor anterior

    print("Tentando definir o Estus como 10...")
    petrus.set_estus(10)   # válido

    print(petrus.mostrar_status())

    # TESTE DO ENCAPSULAMENTO
    # a linha abaixo dá erro:
    # AttributeError: 'Clerigo' object has no attribute '__estus'
    # isso acontece porque o Python renomeia __estus internamente para _MortoVivo__estus
    # (name mangling), então não dá pra acessar direto pelo nome original
    # print(petrus.__estus)

    print(f"\nEstus lido do jeito certo (via getter): {petrus.get_estus()}")
