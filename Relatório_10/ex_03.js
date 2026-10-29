class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `${this.criatura} - Nível de perigo: ${this.nivelDePerigo}`;
    }
}

class DiarioMisterioso {
    #fichas = [];

    constructor(numero) {
        this.numero = numero;
    }

    anotar(criatura, nivelDePerigo) {
        const ficha = new FichaDeCriatura(criatura, nivelDePerigo);
        this.#fichas.push(ficha);
    }

    exibirFichas() {
        console.log(`\n--- Diário ${this.numero} ---`);
        this.#fichas.forEach(f => console.log(f.descrever()));
    }
}

class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}

class CabanaDoMisterio {
    #funcionarios = [];

    constructor(dono) {
        this.dono = dono;
    }

    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`\n--- Cabana do Mistério, do ${this.dono}, está aberta ---`);
        this.#funcionarios.forEach(f => console.log(`${f.nome} - ${f.cargo}`));
    }
}

const diario = new DiarioMisterioso(3);
diario.anotar('Gnomos', 3);
diario.anotar('Multi-Urso', 5);
diario.anotar('Zumbis', 4);
diario.exibirFichas();

const soos = new Funcionario('Soos', 'Faz-tudo');
const wendy = new Funcionario('Wendy', 'Caixa');

const cabana = new CabanaDoMisterio('Stan');
cabana.contratar(soos);
cabana.contratar(wendy);
cabana.abrirAsPortas();

// Composição: as FichaDeCriatura são criadas dentro do método anotar() do diário, então só existem nele.
// Agregação: Soos e Wendy são criados fora da Cabana e só são guardados no array, continuando a existir mesmo sem ela.
