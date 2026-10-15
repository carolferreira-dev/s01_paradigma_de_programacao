# Exercício 2: Herança e Polimorfismo (Suprema em Overwatch)


# CLASSE BASE
class HeroiOverwatch:

    def __init__(self, codinome: str, funcao: str):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"<{self.codinome}> ({self.funcao}) usa uma suprema genérica!")


# HERANÇA
# as filhas não têm __init__ próprio, então usam direto o __init__ do pai
class HeroiTanque(HeroiOverwatch):

    # SOBRESCRITA
    # em Python não precisa de virtual/override, basta redefinir o método
    def usar_suprema(self):
        print(f"<{self.codinome}> ({self.funcao}) ativa a suprema e protege o time com uma barreira gigante!")


class HeroiSuporte(HeroiOverwatch):

    def usar_suprema(self):
        print(f"<{self.codinome}> ({self.funcao}) ativa a suprema e revive os aliados caídos!")

    # método exclusivo do suporte, as outras classes não têm
    def curar_equipe(self):
        print(f"   <{self.codinome}> cura toda a equipe!")


if __name__ == "__main__":
    print("--- Partida de Overwatch ---\n")

    # POLIMORFISMO
    # a lista é anotada como HeroiOverwatch, mas guarda as filhas também
    herois: list[HeroiOverwatch] = [
        HeroiTanque("Reinhardt", "Tanque"),
        HeroiSuporte("Mercy", "Suporte"),
        HeroiOverwatch("Soldado: 76", "Dano"),
    ]

    # POLIMORFISMO EM AÇÃO
    # mesma chamada usar_suprema(), comportamento diferente pra cada objeto
    for heroi in herois:
        heroi.usar_suprema()

        # isinstance verifica o tipo real do objeto
        # só o suporte tem curar_equipe(), então só chamamos nele
        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()
