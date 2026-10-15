# Exercício 3: Composição e Agregação (Infiltração no Palácio)

"""
COMPOSIÇÃO x AGREGAÇÃO no programa:

COMPOSIÇÃO (relação forte): Lider -> Persona
    A Persona é criada DENTRO do __init__ do Lider. Ela nasce junto com o Joker
    e só existe enquanto ele existir. Ninguém de fora cria ou entrega a Persona.

AGREGAÇÃO (relação fraca): Lider -> Aliado
    Os aliados (Ryuji e Ann) são criados no programa principal ANTES do líder e
    só depois são recrutados. A lista _equipe guarda apenas referências para eles,
    então eles continuam existindo mesmo fora do grupo.
"""


class Persona:

    def __init__(self, nome: str, arcano: str):
        self.nome = nome
        self.arcano = arcano

    def invocar(self):
        print(f"   PERSONA! {self.nome} (Arcano: {self.arcano}) foi invocada!")


class Aliado:

    def __init__(self, nome: str, codinome: str):
        self.nome = nome          # nome real
        self.codinome = codinome  # apelido usado nas invasões


class Lider:

    def __init__(self, codinome: str):
        self.codinome = codinome
        # COMPOSIÇÃO: a Persona nasce aqui dentro, junto com o líder
        self.persona = Persona("Arsène", "Louco")
        # AGREGAÇÃO: a equipe começa vazia e recebe aliados que já existem
        self._equipe = []

    def recrutar(self, aliado: Aliado):
        self._equipe.append(aliado)
        print(f"-> {aliado.nome} ({aliado.codinome}) entrou para os Phantom Thieves.")

    def infiltrar(self, palacio):
        print(f"\n--- {self.codinome} invade o Palácio de {palacio}! ---")
        self.persona.invocar()
        print("   Equipe na infiltração:")
        for aliado in self._equipe:
            print(f"   - {aliado.codinome} ({aliado.nome})")


if __name__ == "__main__":
    print("--- Phantom Thieves of Hearts ---\n")

    # agregação: aliados existem antes do líder
    ryuji = Aliado("Ryuji Sakamoto", "Skull")
    ann = Aliado("Ann Takamaki", "Panther")

    joker = Lider("Joker")

    joker.recrutar(ryuji)
    joker.recrutar(ann)

    joker.infiltrar("Kamoshida")
