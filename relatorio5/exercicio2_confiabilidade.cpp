/*
EXERCÍCIO 2 - CONFIABILIDADE DO SISTEMA EM SÉRIE

CRIE UMA FUNÇÃO QUE RECEBA UM ARRAY DE PROBABILIDADES E SEU TAMANHO.
A FUNÇÃO DEVE MULTIPLICAR TODAS AS PROBABILIDADES E RETORNAR O VALOR FINAL.
*/
//bibliotecas
#include <iostream>

using namespace std;

//função de cálculo de confiabilidade
float calcular_confiabilidade_sistema(float probabilidades[], int tamanho)
{
    float probabilidade_final = 1.0;
    
    for (int i = 0; i < tamanho; i++)
    {
        probabilidade_final *= probabilidades[i];
    }
    
    return probabilidade_final;
}

int main()
{
    //declaração de variáveis
    int n;
    float *probabilidades;
    float confiabilidade_total;

    //entrada de dados
    cout << "Digite a quantidade de componentes do sistema: ";
    cin >> n;

    //alocar memória dinamicamente
    probabilidades = new float[n];

    //desenvolvimento
    for (int i = 0; i < n; i++)
    {
        cout << "Digite a probabilidade do componente " << (i + 1) << " (ex: 0.95): ";
        cin >> probabilidades[i];
    }

    confiabilidade_total = calcular_confiabilidade_sistema(probabilidades, n);

    //saída de dados
    cout << "Confiabilidade total do sistema: " << confiabilidade_total << " (" << (confiabilidade_total * 100) << "%)" << endl;

    //liberar memória
    delete[] probabilidades;

    return 0;
}