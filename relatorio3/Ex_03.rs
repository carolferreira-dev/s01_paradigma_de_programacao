// Crie uma função chamada fn
// imprimir_terminados_em(digito: i32,
// limite_inferior: i32, limite_superior: i32).
// Esta função deve receber três números inteiros e
// não retornar nenhum valor.
// Dentro da função, use um laço for para iterar de
// limite_inferior até limite_superior (inclusive). Em
// cada iteração, imprima o número apenas se o seu
// último dígito for igual ao digito informado (dica:
// você pode obter o último dígito de um número
// positivo usando o operador de resto numero % 10).
// Na main, peça ao usuário para digitar:
// O dígito final desejado (de 0 a 9).
// O limite inferior.
// O limite superior.
// Em seguida, chame a função
// imprimir_terminados_em passando os três
// valores fornecidos.

use std::io;

fn imprimir_terminados_em(digito: i32, limite_inferior: i32, limite_superior: i32) {
    let mut encontrados = 0;

    for numero in limite_inferior..=limite_superior {
        let ultimo_digito = numero % 10;

        if ultimo_digito == digito {
            println!("Encontrado: {}", numero);
            encontrados += 1;
        }
    }

    println!("Total de numeros terminados em {}: {}", digito, encontrados);
}

fn main() {
    let mut entrada = String::new();

    println!("Qual digito final voce procura? (0 a 9)");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler o digito final");
    let digito: i32 = entrada.trim().parse().unwrap_or(0);

    entrada.clear();
    println!("A partir de qual numero?");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler o limite inferior");
    let limite_inferior: i32 = entrada.trim().parse().unwrap_or(0);

    entrada.clear();
    println!("Ate qual numero?");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler o limite superior");
    let limite_superior: i32 = entrada.trim().parse().unwrap_or(0);

    imprimir_terminados_em(digito, limite_inferior, limite_superior);
}
