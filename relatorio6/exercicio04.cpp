// Exercício 4: Hobbits da Comarca (Polimorfismo)

#include <iostream>
#include <string>
#include <vector>
using namespace std;

// CLASSE BASE
class Hobbit {
protected:
    string nome;

public:
    Hobbit(string n) : nome(n) {}

    // VIRTUAL
    // sem o virtual, o ponteiro Hobbit* sempre chamaria esta versão,
    // ignorando a versão das classes filhas
    virtual void fazerAtividade() {
        cout << "O hobbit " << nome << " está aproveitando um dia tranquilo na Comarca." << endl;
    }

    // destrutor virtual: garante que o delete chame o destrutor certo da filha
    virtual ~Hobbit() {}
};

// HERANÇA + SOBRESCRITA
class Jardineiro : public Hobbit {
public:
    Jardineiro(string n) : Hobbit(n) {}

    void fazerAtividade() override {
        cout << "O jardineiro " << nome << " está cuidando das flores e plantas ao redor das tocas!" << endl;
    }
};

class Cozinheiro : public Hobbit {
public:
    Cozinheiro(string n) : Hobbit(n) {}

    void fazerAtividade() override {
        cout << "O cozinheiro " << nome << " está preparando o segundo café da manhã para os convidados!" << endl;
    }
};

class Fazendeiro : public Hobbit {
public:
    Fazendeiro(string n) : Hobbit(n) {}

    void fazerAtividade() override {
        cout << "O fazendeiro " << nome << " está colhendo vegetais e hortaliças em suas terras!" << endl;
    }
};

int main() {
    cout << "=== Um dia na Comarca ===\n" << endl;

    // POLIMORFISMO
    // vetor de ponteiros da classe base guardando objetos das classes filhas
    vector<Hobbit*> hobbits;

    // alocação dinâmica com new
    hobbits.push_back(new Jardineiro("Samwise Gamgi"));
    hobbits.push_back(new Cozinheiro("Bilbo Bolseiro"));
    hobbits.push_back(new Fazendeiro("Magote"));

    // POLIMORFISMO EM AÇÃO
    // o vetor trata todos como Hobbit*, mas cada um executa a sua versão
    for (Hobbit* h : hobbits) {
        h->fazerAtividade();
    }

    // liberando a memória alocada com new
    for (Hobbit* h : hobbits) {
        delete h;
    }

    return 0;
}
