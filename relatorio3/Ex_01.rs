// Crie uma função chamada fn validar_placa(placa:
// &str) -> bool.
// A função deve retornar true apenas se a string
// enviada atender a todos os seguintes critérios:
// Ter pelo menos 7 caracteres de comprimento.
// Conter pelo menos 4 letras maiúsculas
// (c.is_ascii_uppercase()).
// Conter pelo menos 2 números (c.is_numeric()).
// Na main, peça ao usuário para digitar a placa de
// um veículo. Use a estrutura loop (com break) para
// continuar pedindo a placa até que a função
// validar_placa retorne true.
// Quando uma placa válida for informada, exiba a
// mensagem "Placa cadastrada no sistema!" e saia
// do laço.
// Dica: Lembre-se de remover a quebra de linha \n
// da leitura do teclado usando .trim()

use std::io;

fn validar_placa(placa: &str) -> bool {
    let mut letras = 0;
    let mut digitos = 0;

    for c in placa.chars() {
        if c.is_ascii_uppercase() {
            letras += 1;
        }

        if c.is_numeric() {
            digitos += 1;
        }
    }

    // Conta quantos dos tres criterios a placa cumpriu
    let mut criterios = 0;

    if placa.len() >= 7 {
        criterios += 1;
    }

    if letras >= 4 {
        criterios += 1;
    }

    if digitos >= 2 {
        criterios += 1;
    }

    criterios == 3
}

fn main() {
    let mut entrada = String::new();

    loop {
        entrada.clear();

        println!("Informe a placa do veiculo:");
        io::stdin().read_line(&mut entrada).expect("Erro ao ler a placa");

        let placa = entrada.trim();

        if validar_placa(placa) {
            println!("Placa cadastrada no sistema!");
            break;
        }

        println!("Placa invalida. Digite novamente.");
    }
}
