// Exercício 2: Herança e Modificadores de Acesso (Persona RPG)

#include <iostream>
#include <string>
using namespace std;

// CLASSE BASE
class Pessoa {
// private = nem as classes filhas acessam direto
// por isso elas precisam usar o construtor e os getters do pai
private:
    string nome;
    int idade;

public:
    Pessoa(string n, int i) : nome(n), idade(i) {}

    string getNome() { return nome; }
    int getIdade() { return idade; }

    virtual ~Pessoa() {}
};

// HERANÇA
class Protagonista : public Pessoa {
private:
    int nivel;

public:
    // o nome e a idade são repassados pro construtor da classe pai
    Protagonista(string n, int i, int nv) : Pessoa(n, i), nivel(nv) {}

    void mostrarDados() {
        // nome e idade são privados de Pessoa, então usamos os getters
        cout << "[Protagonista] " << getNome() << " | Idade: " << getIdade()
             << " | Nível: " << nivel << endl;

        // a linha abaixo daria erro: 'std::string Pessoa::nome' is private within this context
        // cout << nome;
    }
};

class Personagem : public Pessoa {
private:
    int rank;

public:
    Personagem(string n, int i, int r) : Pessoa(n, i), rank(r) {}

    void mostrarDados() {
        cout << "[Personagem] " << getNome() << " | Idade: " << getIdade()
             << " | Rank: " << rank << endl;
    }
};

int main() {
    cout << "=== Persona RPG ===\n" << endl;

    Protagonista joker("Ren Amamiya", 16, 25);
    Personagem ryuji("Ryuji Sakamoto", 16, 5);
    Personagem makoto("Makoto Niijima", 17, 7);

    joker.mostrarDados();
    ryuji.mostrarDados();
    makoto.mostrarDados();

    return 0;
}
