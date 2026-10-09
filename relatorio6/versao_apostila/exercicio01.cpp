// Exercício 1: Abstração e Encapsulamento (Sistema de Combate de Robôs)

#include <iostream>
#include <string>
using namespace std;

// ABSTRAÇÃO
// o robô guarda só o que importa pro combate
class Robo {
// ENCAPSULAMENTO
// atributos privados, só a própria classe altera
private:
    string modelo;
    int versao;
    float potenciaLaser;
    int integridade;

public:
    // construtor com lista de inicialização
    Robo(string m, int v, float p, int i)
        : modelo(m), versao(v), potenciaLaser(p), integridade(i) {}

    string getModelo() { return modelo; }
    int getIntegridade() { return integridade; }

    // o alvo é recebido por referência (&) para que o dano altere o robô original
    void disparar(Robo &alvo) {
        cout << "\n>> " << modelo << " v" << versao << " dispara o laser em " << alvo.modelo << "!" << endl;
        // dentro da classe Robo dá pra acessar o privado de outro Robo
        alvo.receberDano(potenciaLaser);
    }

    void receberDano(float dano) {
        integridade -= (int)dano;
        if (integridade < 0) {
            integridade = 0;
        }
        cout << ">> " << modelo << " sofreu " << dano << " de dano. Integridade: " << integridade << endl;
    }

    void mostrarStatus() {
        cout << "Robô " << modelo << " v" << versao
             << " | Laser: " << potenciaLaser
             << " | Integridade: " << integridade << endl;
    }
};

int main() {
    cout << "=== Arena de Combate de Robôs ===\n" << endl;

    Robo r1("Optimus", 2, 25.5, 100);
    Robo r2("Megatron", 3, 30.0, 100);

    r1.mostrarStatus();
    r2.mostrarStatus();

    // simulando o confronto em turnos até um robô cair
    while (r1.getIntegridade() > 0 && r2.getIntegridade() > 0) {
        r1.disparar(r2);
        if (r2.getIntegridade() > 0) {
            r2.disparar(r1);
        }
    }

    cout << "\n--- Resultado ---" << endl;
    r1.mostrarStatus();
    r2.mostrarStatus();

    string vencedor = (r1.getIntegridade() > 0) ? r1.getModelo() : r2.getModelo();
    cout << "Vencedor: " << vencedor << "!" << endl;

    return 0;
}
