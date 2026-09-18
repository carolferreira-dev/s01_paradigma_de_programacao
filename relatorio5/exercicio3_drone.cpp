/*
EXERCÍCIO 3 - GERENCIAMENTO DE CARGA DE DRONE INDUSTRIAL

O PROGRAMA DEVE GERENCIAR O PESO TRANSPORTADO POR UM DRONE ATRAVÉS DE UM MENU.
REGRAS: NÃO ULTRAPASSAR A CAPACIDADE MÁXIMA E NÃO DESCARREGAR MAIS DO QUE O PESO ATUAL.
*/
//bibliotecas
#include <iostream>

using namespace std;

int main()
{
    //declaração de variáveis
    float capacidade_maxima;
    float carga_atual = 0.0;
    float peso_pacote;
    int opcao = 0;

    //entrada de dados
    cout << "Informe a capacidade maxima de carga do drone (kg): ";
    cin >> capacidade_maxima;

    //desenvolvimento (menu interativo)
    while (opcao != 4)
    {
        cout << "\n=== SISTEMA DE CARGA DO DRONE ===" << endl;
        cout << "1. Verificar Carga" << endl;
        cout << "2. Carregar Pacote" << endl;
        cout << "3. Descarregar Pacote" << endl;
        cout << "4. Encerrar Operacao" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        if (opcao == 1)
        {
            //saída de dados - verificação
            cout << "Carga Atual: " << carga_atual << " kg / " << capacidade_maxima << " kg" << endl;
            cout << "Espaco Disponivel: " << (capacidade_maxima - carga_atual) << " kg" << endl;
        }
        else if (opcao == 2)
        {
            //entrada e desenvolvimento - carregar
            cout << "Digite o peso do pacote a ser carregado (kg): ";
            cin >> peso_pacote;

            if ((carga_atual + peso_pacote) > capacidade_maxima)
            {
                cout << "Alerta: Peso maximo de decolagem excedido! Operacao cancelada." << endl;
            }
            else
            {
                carga_atual += peso_pacote;
                cout << "Pacote adicionado com sucesso!" << endl;
            }
        }
        else if (opcao == 3)
        {
            //entrada e desenvolvimento - descarregar
            cout << "Digite o peso do pacote a ser descarregado (kg): ";
            cin >> peso_pacote;

            if (peso_pacote > carga_atual)
            {
                cout << "Alerta: Nao e possivel descarregar mais peso do que o drone carrega no momento!" << endl;
            }
            else
            {
                carga_atual -= peso_pacote;
                cout << "Pacote descarregado com sucesso!" << endl;
            }
        }
        else if (opcao == 4)
        {
            //saída de dados - encerramento
            cout << "Encerrando sistema de telemetria..." << endl;
        }
        else
        {
            cout << "Opcao invalida! Tente novamente." << endl;
        }
    }

    return 0;
}