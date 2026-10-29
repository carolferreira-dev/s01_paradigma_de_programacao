// Cenário: Valorant é um jogo de tiro tático em que dois times de cinco agentes se enfrentam.
// Os agentes fazem parte do Protocolo VALORANT, uma organização secreta, e cada um tem uma
// função no time, com uma habilidade própria. Todo agente entra na partida com uma pistola,
// que é dele e é criada junto com ele (composição). Os agentes já existem antes de serem
// reunidos em um esquadrão (agregação).
// Tarefa:
// 1. Crie a classe Pistola, cujo constructor recebe e guarda modelo.
// 2. Crie a classe base AgenteProtocolo, cujo constructor recebe codinome e modeloDaPistola:
//    codinome fica em um atributo público;
//    a Pistola é criada dentro do constructor e guardada no atributo privado #pistola.
//    O método usarHabilidade() apenas lança um erro com throw new Error(...), e o método
//    entrarEmCombate() imprime o codinome, o modelo da pistola e o texto retornado por
//    usarHabilidade().
// 3. Crie as classes Controlador, Iniciador e Duelista, que herdam de AgenteProtocolo, sem
//    constructor próprio. Cada uma sobrescreve usarHabilidade() para retornar uma
//    habilidade típica da sua função.
// 4. Crie a classe Esquadrao, cujo constructor recebe nome e um array de agentes já criados,
//    guardado no atributo privado #agentes, com os métodos:
//    iniciarPartida(), que imprime o nome do esquadrão e, com forEach, chama
//    entrarEmCombate() de cada agente;
//    listarControladores(), que usa filter com instanceof para retornar só os agentes da
//    classe Controlador.
// 5. No programa principal, crie dois controladores, um iniciador e um duelista. Reúna os
//    quatro em um esquadrão, chame iniciarPartida() e imprima, com forEach, o codinome de
//    cada agente retornado por listarControladores().
// 6. Crie um AgenteProtocolo diretamente e, na linha seguinte, chame entrarEmCombate() nele.
//    Observe que o objeto é criado, mas a chamada gera um erro. Depois, transforme a linha
//    da chamada em comentário (//) para o programa voltar a rodar.


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
        throw new Error(`O agente ${this.codinome} deve implementar o metodo usarHabilidade()`);
    }

    entrarEmCombate() {
        console.log(`${this.codinome} entra com a ${this.#pistola.modelo} e ${this.usarHabilidade()}`);
    }
}


class Controlador extends AgenteProtocolo {
    usarHabilidade() {
        return 'lanca uma cortina de fumaca no bomb.';
    }
}


class Iniciador extends AgenteProtocolo {
    usarHabilidade() {
        return 'dispara uma flecha de reconhecimento que revela os inimigos.';
    }
}


class Duelista extends AgenteProtocolo {
    usarHabilidade() {
        return 'avanca com um dash e abre o combate.';
    }
}


class Esquadrao {
    #agentes;

    constructor(nome, agentes) {
        this.nome = nome;
        this.#agentes = agentes;
    }

    iniciarPartida() {
        console.log(`\n=== Esquadrao ${this.nome} inicia a partida ===`);
        this.#agentes.forEach(agente => agente.entrarEmCombate());
    }

    listarControladores() {
        return this.#agentes.filter(agente => agente instanceof Controlador);
    }
}


console.log('=== Protocolo VALORANT: convocacao ===');

const brimstone = new Controlador('Brimstone', 'Classic');
const omen = new Controlador('Omen', 'Ghost');
const sova = new Iniciador('Sova', 'Sheriff');
const jett = new Duelista('Jett', 'Frenzy');

const alfa = new Esquadrao('Alfa', [brimstone, omen, sova, jett]);

alfa.iniciarPartida();

console.log('\nControladores do esquadrao:');
alfa.listarControladores().forEach(agente => console.log(`- ${agente.codinome}`));

const recruta = new AgenteProtocolo('Recruta', 'Classic');
// recruta.entrarEmCombate();
