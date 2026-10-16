class HeroiOverwatch:

    def __init__(self, codinome: str, funcao: str):
        self.codinome = codinome
        self.funcao = funcao

    def usar_suprema(self):
        print(f"{self.codinome} ({self.funcao}) usa uma suprema genérica!")


class HeroiTanque(HeroiOverwatch):

    def usar_suprema(self):
        print(f"{self.codinome} ({self.funcao}) usa a suprema de TANQUE: protege a equipe e avança na linha de frente!")


class HeroiSuporte(HeroiOverwatch):

    def usar_suprema(self):
        print(f"{self.codinome} ({self.funcao}) usa a suprema de SUPORTE: fortalece toda a equipe!")

    def curar_equipe(self):
        print(f"{self.codinome} cura a equipe!")


if __name__ == "__main__":
    herois: list[HeroiOverwatch] = [
        HeroiOverwatch("Soldado 76", "Dano"),
        HeroiTanque("Reinhardt", "Tanque"),
        HeroiSuporte("Mercy", "Suporte"),
    ]

    for heroi in herois:
        heroi.usar_suprema()
        if isinstance(heroi, HeroiSuporte):
            heroi.curar_equipe()
