// Exercício 2: Links Sociais em Persona (Encapsulamento)

#include <iostream>
#include <string>
using namespace std;

class LinkSocial {
// ENCAPSULAMENTO
// os atributos são privados: ninguém de fora da classe mexe direto neles
private:
    string nome;    // nome do personagem
    string arcana;  // arcana que representa o link
    int rank;

// a única forma de acessar os dados é pelos métodos públicos
public:
    // SETTERS - alteram os atributos de forma controlada
    void setNome(string n) {
        nome = n;
    }

    void setArcana(string a) {
        arcana = a;
    }

    void setRank(int r) {
        rank = r;
    }

    // GETTERS - só leem os atributos
    string getNome() {
        return nome;
    }

    string getArcana() {
        return arcana;
    }

    int getRank() {
        return rank;
    }

    void subirRank() {
        rank++;
    }
};

int main() {
    cout << "=== Persona: Links Sociais ===\n" << endl;

    LinkSocial link;

    // definindo os dados pelos setters
    link.setNome("Ryuji Sakamoto");
    link.setArcana("Carruagem");
    link.setRank(1);

    cout << "Rank inicial: " << link.getRank() << endl;

    // passaram tempo juntos...
    link.subirRank();
    cout << "Vocês passaram um tempo juntos. O Link Social ficou mais forte!\n" << endl;

    // exibindo os dados pelos getters
    cout << "--- Link Social ---" << endl;
    cout << "Personagem: " << link.getNome() << endl;
    cout << "Arcana: " << link.getArcana() << endl;
    cout << "Rank: " << link.getRank() << endl;

    // TESTE DO ENCAPSULAMENTO
    // a linha abaixo dá erro de compilação:
    // error: 'int LinkSocial::rank' is private within this context
    // link.rank = 10;

    return 0;
}
