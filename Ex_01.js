// Cenário: No mundo de Pokémon, treinadores levam criaturas chamadas Pokémon para batalhas
// em ginásios. Cada Pokémon pertence a uma espécie, tem um tipo, que define os seus golpes,
// e uma quantidade de vida. A vida não pode ser alterada diretamente de fora: só os golpes
// recebidos em combate podem reduzi-la, e ela nunca fica abaixo de zero.
// Tarefa:
// 1. Crie a classe Pokemon, cujo constructor recebe apelido, tipo e vidaInicial:
//    apelido e tipo são atributos públicos;
//    a vida fica no atributo privado #vida, que começa com o valor de vidaInicial;
//    a classe tem o getter vida (com get) e nenhum setter.
// 2. Em Pokemon, crie o método sofrerDano(pontos), que subtrai os pontos da vida sem
//    deixá-la negativa e imprime o apelido e a vida restante, e o método atacar(alvo),
//    que imprime um ataque genérico e chama alvo.sofrerDano(10).
// 3. Crie a classe Squirtle, que herda de Pokemon. O constructor recebe apelido e
//    vidaInicial e chama super(...) com o tipo fixo 'Água'. Sobrescreva atacar(alvo) para
//    imprimir um golpe de água e chamar alvo.sofrerDano(20).
// 4. Crie a classe Bulbasaur, do mesmo jeito, com o tipo fixo 'Planta'. Sobrescreva
//    atacar(alvo) para imprimir um golpe de planta e chamar alvo.sofrerDano(15).
// 5. No programa principal, crie um Squirtle e um Bulbasaur (este com vida 30). Faça o
//    Bulbasaur atacar o Squirtle uma vez e o Squirtle atacar o Bulbasaur duas vezes.
//    Depois, imprima a vida dos dois usando o getter.
// 6. Tente imprimir o #vida de um dos Pokémon diretamente no programa principal e observe
//    o erro. Depois, transforme essa linha em comentário (//) para o programa voltar a rodar.


class Pokemon {
    #vida;

    constructor(apelido, tipo, vidaInicial) {
        this.apelido = apelido;
        this.tipo = tipo;
        this.#vida = vidaInicial;
    }

    get vida() {
        return this.#vida;
    }

    sofrerDano(pontos) {
        this.#vida -= pontos;
        if (this.#vida < 0) {
            this.#vida = 0;
        }
        console.log(`${this.apelido} ficou com ${this.#vida} de vida.`);
    }

    atacar(alvo) {
        console.log(`${this.apelido} avanca e acerta ${alvo.apelido} com uma investida!`);
        alvo.sofrerDano(10);
    }
}


class Squirtle extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Água', vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usa Jato d'Agua em ${alvo.apelido}!`);
        alvo.sofrerDano(20);
    }
}


class Bulbasaur extends Pokemon {
    constructor(apelido, vidaInicial) {
        super(apelido, 'Planta', vidaInicial);
    }

    atacar(alvo) {
        console.log(`${this.apelido} usa Chicote de Vinha em ${alvo.apelido}!`);
        alvo.sofrerDano(15);
    }
}


console.log('=== Ginasio de Celadon: duelo oficial ===');

const casco = new Squirtle('Casco', 50);
const brotinho = new Bulbasaur('Brotinho', 30);

console.log(`${casco.apelido} (${casco.tipo}) x ${brotinho.apelido} (${brotinho.tipo})\n`);

brotinho.atacar(casco);
casco.atacar(brotinho);
casco.atacar(brotinho);

console.log('\n=== Fim do duelo ===');
console.log(`Vida de ${casco.apelido}: ${casco.vida}`);
console.log(`Vida de ${brotinho.apelido}: ${brotinho.vida}`);

// console.log(casco.#vida);
