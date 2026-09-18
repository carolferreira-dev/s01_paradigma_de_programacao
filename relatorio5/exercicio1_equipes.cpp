/*
EXERCÍCIO 1 - COMBINAÇÃO DE EQUIPES

CRIE UMA FUNÇÃO RECURSIVA PARA DETERMINAR CENÁRIOS DE CONFRONTOS.
- SE n = 0, RETORNA 0.
- SE n = 1, RETORNA 1.
- PARA n > 1, RETORNA A SOMA DOS DOIS NÍVEIS ANTERIORES.
*/
//bibliotecas
#include <iostream>

using namespace std;

//função recursiva
int combinar_equipes(int n)
{
    //pontos de parada
    if (n == 0) return 0;
    if (n == 1) return 1;
    
    //chamada recursiva
    return combinar_equipes(n - 1) + combinar_equipes(n - 2);
}

int main()
{
    //declaração de variáveis
    int n;
    int total;

    //entrada de dados
    cout << "Digite o tamanho do chaveamento (n): ";
    cin >> n;

    //desenvolvimento
    total = combinar_equipes(n);

    //saída de dados
    cout << "Total de cenarios de confrontos possiveis: " << total << endl;

    return 0;
}