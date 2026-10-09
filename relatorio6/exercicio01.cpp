// Exercício 1: Duelo de Bandas (Abstração)

#include <iostream>
#include <string>
using namespace std;

// ABSTRAÇÃO
// a banda só guarda o que importa pro duelo:
// nome, integrantes, potência do som e a energia da plateia
class Banda {
public:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    // recebe a banda rival por REFERÊNCIA (&)
    // sem o &, o C++ faria uma cópia e a energia da rival original não mudaria
    void duelar(Banda &rival) {
        cout << "\n>> " << nome << " sobe ao palco e desafia " << rival.nome << "!" << endl;
        cout << ">> Som a " << potenciaSom << " de potência ecoando pelo festival..." << endl;

        rival.energia -= potenciaSom;
        if (rival.energia < 0) {
            rival.energia = 0;
        }

        cout << ">> A plateia de " << rival.nome << " perdeu " << potenciaSom << " de energia!" << endl;
    }

    void mostrarStatus() {
        cout << "Banda: " << nome
             << " | Integrantes: " << integrantes
             << " | Potência: " << potenciaSom
             << " | Energia da plateia: " << energia << endl;
    }
};

int main() {
    cout << "=== Festival de Música: Duelo de Bandas ===\n" << endl;

    // instanciando os objetos e atribuindo os valores
    Banda banda1;
    banda1.nome = "Os Mutantes";
    banda1.integrantes = 3;
    banda1.potenciaSom = 35.5;
    banda1.energia = 100;

    Banda banda2;
    banda2.nome = "Sepultura";
    banda2.integrantes = 4;
    banda2.potenciaSom = 42.0;
    banda2.energia = 100;

    cout << "--- Status Inicial ---" << endl;
    banda1.mostrarStatus();
    banda2.mostrarStatus();

    // banda1 é a desafiante e banda2 é a rival
    banda1.duelar(banda2);

    cout << "\n--- Status Final ---" << endl;
    banda1.mostrarStatus();
    banda2.mostrarStatus();

    return 0;
}
