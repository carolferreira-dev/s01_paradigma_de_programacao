/*
EXERCÍCIO 4 - TELEMETRIA DE PAINEL SOLAR

GERENCIE UMA MATRIZ 5x5 DE CÉLULAS FOTOVOLTAICAS (0 PARA INATIVA, 1 PARA ATIVA).
EXIBA UM MENU PARA ATIVAR CÉLULAS, VER MAPA DA MATRIZ E EXIBIR RELATÓRIO FINAL.
*/
//bibliotecas
#include <iostream>

using namespace std;

int main()
{
    //declaração de variáveis
    int matriz_solar[5][5] = {0}; //inicializa todas as células com 0
    int opcao = 0;
    int fileira, coluna;
    int ativas, inativas;
    float percentual;

    //desenvolvimento (menu interativo)
    while (opcao != 3)
    {
        cout << "\n=== TELEMETRIA DO PAINEL SOLAR ===" << endl;
        cout << "1. Ativar Celula" << endl;
        cout << "2. Ver Mapa da Matriz" << endl;
        cout << "3. Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        if (opcao == 1)
        {
            //entrada de dados
            cout << "Digite a fileira (0-4): ";
            cin >> fileira;
            cout << "Digite a coluna (0-4): ";
            cin >> coluna;

            //desenvolvimento - ativação
            if (fileira >= 0 && fileira < 5 && coluna >= 0 && coluna < 5)
            {
                if (matriz_solar[fileira][coluna] == 0)
                {
                    matriz_solar[fileira][coluna] = 1;
                    cout << "Sucesso: Celula solar ativada!" << endl;
                }
                else
                {
                    cout << "Erro: Celula solar ja esta em operacao!" << endl;
                }
            }
            else
            {
                cout << "Coordenadas invalidas!" << endl;
            }
        }
        else if (opcao == 2)
        {
            //saída de dados - mapa
            cout << "Mapa da Matriz Solar" << endl;
            for (int i = 0; i < 5; i++)
            {
                for (int j = 0; j < 5; j++)
                {
                    cout << "[" << matriz_solar[i][j] << "] ";
                }
                cout << endl;
            }
        }
    }

    //desenvolvimento - contagem para relatório final
    ativas = 0;
    inativas = 0;

    for (int i = 0; i < 5; i++)
    {
        for (int j = 0; j < 5; j++)
        {
            if (matriz_solar[i][j] == 1)
            {
                ativas++;
            }
            else
            {
                inativas++;
            }
        }
    }

    percentual = ((float)ativas / 25.0) * 100.0;

    //saída de dados - relatório
    cout << "\n=== RELATORIO FINAL DE OPERACAO ===" << endl;
    cout << "Total de celulas ATIVAS: " << ativas << endl;
    cout << "Total de celulas INATIVAS: " << inativas << endl;
    cout << "Capacidade Operacional: " << percentual << "%" << endl;

    return 0;
}