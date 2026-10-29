// Cenário: Em Hunter x Hunter, Hunters são aventureiros licenciados que dominam o Nen, a
// técnica de controlar a própria energia vital, chamada de aura. Todo usuário de Nen pertence
// a um tipo de Nen, que define o seu estilo de luta. A Trupe Fantasma, um grupo de ladrões
// cujos membros são chamados de Aranhas, foi avistada em uma cidade, e três Hunters de tipos
// diferentes vão enfrentá-la.
// Tarefa:
// 1. Crie a classe base UsuarioDeNen, cujo constructor recebe nome. O método atacar(alvo)
//    recebe uma Aranha e imprime um ataque genérico de aura contra ela, citando o nome dos
//    dois.
// 2. Crie as classes Intensificador, Transmutador e Materializador, que herdam de
//    UsuarioDeNen, sem constructor próprio. Cada uma sobrescreve atacar(alvo) para imprimir
//    um ataque típico do seu tipo de Nen, citando o nome dos dois.
// 3. Crie a classe Aranha, cujo constructor recebe nome e numero.
// 4. Crie a classe TrupeFantasma, cujo constructor recebe cidade e um array de Aranhas já
//    criadas, com valor padrão [], guardado no atributo privado #aranhas, com os métodos:
//    revelarAranhas(), que imprime a cidade e, com forEach, o número e o nome de cada Aranha;
//    buscarAranha(numero), que usa find para retornar a Aranha com o número informado.
// 5. No programa principal, crie duas Aranhas antes da Trupe. Crie a Trupe, chame
//    revelarAranhas() e use buscarAranha(...) para pegar uma das duas Aranhas.
// 6. Crie um array com um usuário de Nen de cada tipo e percorra-o com forEach, fazendo cada
//    um chamar atacar(...) contra a Aranha encontrada.


class UsuarioDeNen {
    constructor(nome) {
        this.nome = nome;
    }

    atacar(alvo) {
        console.log(`${this.nome} concentra a aura e golpeia ${alvo.nome}!`);
    }
}


class Intensificador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} fortalece o punho com aura e acerta um Jajanken em ${alvo.nome}!`);
    }
}


class Transmutador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} transforma a aura em eletricidade e da um choque em ${alvo.nome}!`);
    }
}


class Materializador extends UsuarioDeNen {
    atacar(alvo) {
        console.log(`${this.nome} materializa correntes de aura e prende ${alvo.nome}!`);
    }
}


class Aranha {
    constructor(nome, numero) {
        this.nome = nome;
        this.numero = numero;
    }
}


class TrupeFantasma {
    #aranhas;

    constructor(cidade, aranhas = []) {
        this.cidade = cidade;
        this.#aranhas = aranhas;
    }

    revelarAranhas() {
        console.log(`\n=== Trupe Fantasma avistada em ${this.cidade} ===`);
        this.#aranhas.forEach(aranha => console.log(`Aranha n. ${aranha.numero} - ${aranha.nome}`));
    }

    buscarAranha(numero) {
        return this.#aranhas.find(aranha => aranha.numero === numero);
    }
}


console.log('=== Associacao Hunter: alerta de ameaca ===');

const uvogin = new Aranha('Uvogin', 11);
const nobunaga = new Aranha('Nobunaga', 1);

const trupe = new TrupeFantasma('Yorknew', [uvogin, nobunaga]);
trupe.revelarAranhas();

const alvo = trupe.buscarAranha(11);

if (alvo) {
    console.log(`\n=== Os Hunters encontram ${alvo.nome} ===`);

    const hunters = [
        new Intensificador('Gon Freecss'),
        new Transmutador('Killua Zoldyck'),
        new Materializador('Kurapika')
    ];

    hunters.forEach(hunter => hunter.atacar(alvo));
}
