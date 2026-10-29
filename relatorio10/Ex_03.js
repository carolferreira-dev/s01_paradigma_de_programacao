// Cenário: Em Gravity Falls, dois irmãos gêmeos passam as férias em uma cidadezinha cheia de
// mistérios, na casa do tio-avô, que administra a Cabana do Mistério: uma loja de souvenirs e
// falsas atrações para turistas. Lá, eles encontram um diário misterioso, escrito por um autor
// desconhecido, que registra as criaturas sobrenaturais da cidade. Cada ficha é escrita dentro
// do diário e só existe nele (composição). Já os funcionários da Cabana são moradores da
// cidade, que existiam antes de serem contratados e continuam existindo fora dela (agregação).
// Tarefa:
// 1. Crie a classe FichaDeCriatura, cujo constructor recebe criatura e nivelDePerigo. O
//    método descrever() retorna um texto com os dois dados.
// 2. Crie a classe DiarioMisterioso, cujo constructor recebe numero, com o atributo privado
//    #fichas, que começa como um array vazio, e os métodos:
//    anotar(criatura, nivelDePerigo), que cria uma FichaDeCriatura dentro do método e a
//    adiciona ao #fichas com push;
//    exibirFichas(), que imprime o número do diário e, com forEach, o texto retornado por
//    descrever() de cada ficha.
// 3. Crie a classe Funcionario, cujo constructor recebe nome e cargo.
// 4. Crie a classe CabanaDoMisterio, cujo constructor recebe dono, com o atributo privado
//    #funcionarios, que começa como um array vazio, e os métodos:
//    contratar(funcionario), que adiciona um funcionário já criado ao #funcionarios com push;
//    abrirAsPortas(), que imprime o nome do dono e, com forEach, o nome e o cargo de cada
//    funcionário.
// 5. No programa principal, crie um diário, anote nele duas ou três criaturas e chame
//    exibirFichas(). Depois, crie dois funcionários antes da Cabana. Por fim, crie a Cabana,
//    contrate os dois e chame abrirAsPortas().
// 6. Explique, em um comentário no código, o que é composição e o que é agregação no seu
//    programa.


class FichaDeCriatura {
    constructor(criatura, nivelDePerigo) {
        this.criatura = criatura;
        this.nivelDePerigo = nivelDePerigo;
    }

    descrever() {
        return `${this.criatura} - nivel de perigo ${this.nivelDePerigo}`;
    }
}


// Composição: o DiarioMisterioso cria as próprias fichas dentro do anotar
// (new FichaDeCriatura(...)). As fichas não existem fora do diário: ninguém no programa
// principal tem uma referência a elas, e elas deixam de existir junto com o diário.
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
        console.log(`\n=== Diario ${this.numero} ===`);
        this.#fichas.forEach(ficha => console.log(ficha.descrever()));
    }
}


class Funcionario {
    constructor(nome, cargo) {
        this.nome = nome;
        this.cargo = cargo;
    }
}


// Agregação: a CabanaDoMisterio não cria os funcionários, ela só recebe funcionários prontos
// no contratar. Soos e Wendy são criados antes da Cabana, e o #funcionarios guarda só uma
// referência para eles, então os dois continuam existindo fora da Cabana.
class CabanaDoMisterio {
    #funcionarios = [];

    constructor(dono) {
        this.dono = dono;
    }

    contratar(funcionario) {
        this.#funcionarios.push(funcionario);
    }

    abrirAsPortas() {
        console.log(`\n=== ${this.dono} abre a Cabana do Misterio ===`);
        this.#funcionarios.forEach(funcionario => {
            console.log(`${funcionario.nome} - ${funcionario.cargo}`);
        });
    }
}


console.log('=== Gravity Falls, Oregon ===');

const diario = new DiarioMisterioso(3);
diario.anotar('Gnomos', 2);
diario.anotar('Gobblewonker', 4);
diario.anotar('Bill Cipher', 5);
diario.exibirFichas();

const soos = new Funcionario('Soos Ramirez', 'Faz-tudo');
const wendy = new Funcionario('Wendy Corduroy', 'Caixa');

const cabana = new CabanaDoMisterio('Tio Stan');
cabana.contratar(soos);
cabana.contratar(wendy);
cabana.abrirAsPortas();
