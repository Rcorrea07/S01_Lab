class Persona:

    def __init__(self, nome: str, arcano: str):
        self.nome = nome
        self.arcano = arcano

    def invocar(self):
        print(f"Persona invocada: {self.nome} | Arcano: {self.arcano}")


class Aliado:

    def __init__(self, nome: str, codinome: str):
        self.nome = nome
        self.codinome = codinome


class Lider:

    def __init__(self, codinome: str):
        self.codinome = codinome
        self.persona = Persona("Arsène", "Louco")
        self._equipe = []

    def recrutar(self, aliado: Aliado):
        self._equipe.append(aliado)
        print(f"{aliado.nome} ({aliado.codinome}) foi recrutado por {self.codinome}.")

    def infiltrar(self, palacio):
        print(f"\n{self.codinome} invadiu o Palácio de {palacio}!")
        self.persona.invocar()
        print("Equipe:")
        for aliado in self._equipe:
            print(f"- {aliado.nome} ({aliado.codinome})")


if __name__ == "__main__":
    ryuji = Aliado("Ryuji Sakamoto", "Skull")
    ann = Aliado("Ann Takamaki", "Panther")

    joker = Lider("Joker")
    joker.recrutar(ryuji)
    joker.recrutar(ann)

    joker.infiltrar("Kamoshida")
