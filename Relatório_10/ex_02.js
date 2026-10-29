class Pistola {
    constructor(modelo) {
        this.modelo = modelo;
    }
}

class AgenteProtocolo {
    #pistola;

    constructor(codinome, modeloDaPistola) {
        this.codinome = codinome;
        this.#pistola = new Pistola(modeloDaPistola);
    }

    usarHabilidade() {
        throw new Error(`O agente ${this.codinome} deve implementar usarHabilidade()`);
    }

    entrarEmCombate() {
        console.log(`${this.codinome} entra em combate com a ${this.#pistola.modelo} | ${this.usarHabilidade()}`);
    }
}

class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Lança uma cortina de fumaça para bloquear a visão dos inimigos.';
    }
}

class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return 'Revela a posição dos inimigos com um drone.';
    }
}

class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return 'Avança primeiro e atordoa os inimigos com uma explosão.';
    }
}

class Esquadrao {
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`\n--- Esquadrão ${this.nome} inicia a partida ---`);
        this.#agentes.forEach(a => a.entrarEmCombate());
    }

    listarControladores() {
        return this.#agentes.filter(a => a instanceof Controlador);
    }
}

const brimstone = new Controlador('Brimstone', 'Ghost');
const omen = new Controlador('Omen', 'Sheriff');
const sova = new Iniciador('Sova', 'Classic');
const jett = new Duelista('Jett', 'Frenzy');

const esquadrao = new Esquadrao('Alfa', [brimstone, omen, sova, jett]);

esquadrao.iniciarPartida();

console.log('\nControladores:');
esquadrao.listarControladores().forEach(c => console.log(`- ${c.codinome}`));

const agente = new AgenteProtocolo('Agente X', 'Shorty');
// agente.entrarEmCombate();
