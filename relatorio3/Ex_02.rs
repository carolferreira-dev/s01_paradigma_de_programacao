// Crie uma função chamada fn
// acertou_o_alvo(palpite: i32, numero_secreto: i32) ->
// bool.
// A função deve retornar true apenas se a diferença
// absoluta entre o palpite do usuário e o número
// secreto for de no máximo 5 unidades (ou seja,
// |palpite - numero_secreto| <= 5).
// Na main:
// Defina um número secreto hardcoded (ex: let
// numero_secreto: i32 = 13;).
// Utilizando a estrutura loop, peça repetidamente
// para o usuário digitar seu palpite.
// Se o palpite estiver fora da tolerância (função
// retorna false), exiba "Você passou longe! Tente
// novamente." e continue no laço.
// Se o palpite estiver dentro da tolerância de 5
// unidades (função retorna true):
// Calcule e exiba a distância exata em que ele
// ficou do alvo (ex: "Você acertou! Ficou a apenas
// X unidades do número secreto!").
// Encerre o laço de repetição (break).

use std::io;

fn acertou_o_alvo(palpite: i32, numero_secreto: i32) -> bool {
    let mut distancia = palpite - numero_secreto;

    // Transforma a diferenca em valor positivo sem usar .abs()
    if distancia < 0 {
        distancia = -distancia;
    }

    distancia <= 5
}

fn main() {
    let numero_secreto: i32 = 27;
    let mut entrada = String::new();

    loop {
        entrada.clear();

        println!("Tente adivinhar o numero secreto:");
        io::stdin().read_line(&mut entrada).expect("Erro ao ler o palpite");

        let palpite: i32 = entrada.trim().parse().unwrap_or(0);

        if acertou_o_alvo(palpite, numero_secreto) {
            let mut distancia = palpite - numero_secreto;

            if distancia < 0 {
                distancia = -distancia;
            }

            println!("Voce acertou! Ficou a apenas {} unidades do numero secreto!", distancia);
            break;
        }

        println!("Voce passou longe! Tente novamente.");
    }
}
