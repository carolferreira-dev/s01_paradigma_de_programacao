// Crie uma função chamada fn
// calcular_pontuacao(prova1: f64, prova2: f64,
// redacao: f64) -> f64.
// A função deve calcular e retornar a pontuação
// final do candidato seguindo a regra:
// Calcule a média aritmética entre a prova1 e a
// prova2. Essa será a Nota das Provas Teóricas
// (NPT).
// Calcule a Pontuação Final (PF) aplicando uma
// média ponderada com peso de 60% (0.6) para
// a NPT e 40% (0.4) para a redacao.
// Condições da Função:
// Se a Pontuação Final for maior ou igual a 60.0,
// exiba a mensagem: "Parabéns! Candidato
// aprovado no processo seletivo." e mostre o
// resultado.

use std::io;

fn calcular_pontuacao(prova1: f64, prova2: f64, redacao: f64) -> f64 {
    let npt = (prova1 + prova2) / 2.0;
    let peso_teorico = npt * 0.6;
    let peso_redacao = redacao * 0.4;
    let pontuacao_final = peso_teorico + peso_redacao;

    if pontuacao_final >= 60.0 {
        println!("Parabens! Candidato aprovado no processo seletivo.");
    } else {
        println!("Candidato reprovado no processo seletivo.");
    }

    pontuacao_final
}

fn main() {
    let mut entrada = String::new();

    println!("Nota da primeira prova:");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler a primeira prova");
    let prova1: f64 = entrada.trim().parse().unwrap_or(0.0);

    entrada.clear();
    println!("Nota da segunda prova:");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler a segunda prova");
    let prova2: f64 = entrada.trim().parse().unwrap_or(0.0);

    entrada.clear();
    println!("Nota da redacao:");
    io::stdin().read_line(&mut entrada).expect("Erro ao ler a redacao");
    let redacao: f64 = entrada.trim().parse().unwrap_or(0.0);

    let resultado = calcular_pontuacao(prova1, prova2, redacao);

    println!("Pontuacao final do candidato: {:.2}", resultado);
}
