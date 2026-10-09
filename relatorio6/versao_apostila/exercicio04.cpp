// Exercício 4: Polimorfismo em Coleções (Conselho das Terras Ancestrais)

#include <iostream>
#include <string>
#include <vector>
using namespace std;

// CLASSE BASE
class MembroConselho {
protected:
    string nome;

public:
    MembroConselho(string n) : nome(n) {}

    virtual void saudar() {
        cout << "Saudações ao Conselho, eu sou " << nome << "." << endl;
    }

    virtual ~MembroConselho() {}
};

// HERANÇA + SOBRESCRITA
class Anao : public MembroConselho {
public:
    Anao(string n) : MembroConselho(n) {}

    void saudar() override {
        cout << "Pelas forjas da montanha! Eu sou o anão " << nome << "." << endl;
    }
};

class Orc : public MembroConselho {
public:
    Orc(string n) : MembroConselho(n) {}

    void saudar() override {
        cout << "Lok'tar! Eu sou o orc " << nome << " e trago a força do meu clã." << endl;
    }
};

class Draconato : public MembroConselho {
public:
    Draconato(string n) : MembroConselho(n) {}

    void saudar() override {
        cout << "Que o fogo dos dragões nos guie. Eu sou o draconato " << nome << "." << endl;
    }
};

int main() {
    cout << "=== Conselho das Terras Ancestrais ===\n" << endl;

    // POLIMORFISMO EM COLEÇÕES
    vector<MembroConselho*> conselho;

    conselho.push_back(new Anao("Thorin"));
    conselho.push_back(new Orc("Thrall"));
    conselho.push_back(new Draconato("Kriv"));

    for (MembroConselho* m : conselho) {
        m->saudar();
    }

    // liberando a memória
    for (MembroConselho* m : conselho) {
        delete m;
    }

    return 0;
}
