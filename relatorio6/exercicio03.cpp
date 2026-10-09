// Exercício 3: Comunidade Inatel (Herança)

#include <iostream>
#include <string>
using namespace std;

// CLASSE BASE
// todo membro do Inatel tem um nome
class MembroInatel {
protected:
    // protected = as classes filhas conseguem acessar o nome
    string nome;

public:
    // construtor com lista de inicialização
    MembroInatel(string n) : nome(n) {}

    // virtual = permite que as filhas sobrescrevam o método
    virtual void seApresentar() {
        cout << "Sou um membro da comunidade Inatel: " << nome << "." << endl;
    }

    virtual ~MembroInatel() {}
};

// HERANÇA
// Aluno É UM MembroInatel, já nasce com o atributo nome
class Aluno : public MembroInatel {
private:
    string curso;

public:
    // repassa o nome pro construtor do pai
    Aluno(string n, string c) : MembroInatel(n), curso(c) {}

    // SOBRESCRITA (override)
    void seApresentar() override {
        cout << "Meu nome é " << nome << " e estudo no curso de " << curso << "." << endl;
    }
};

class Professor : public MembroInatel {
private:
    string disciplina;

public:
    Professor(string n, string d) : MembroInatel(n), disciplina(d) {}

    void seApresentar() override {
        cout << "Meu nome é " << nome << " e leciono a disciplina de " << disciplina << "." << endl;
    }
};

int main() {
    cout << "=== FETIN - Comunidade Inatel ===\n" << endl;

    MembroInatel membro("Visitante da FETIN");
    Aluno aluno("Carol", "Engenharia de Software");
    Professor professor("Pedro", "Laboratório de Linguagens de Programação");

    // a classe base usa a versão original
    membro.seApresentar();

    // cada filha reaproveita o nome herdado e personaliza o seApresentar()
    aluno.seApresentar();
    professor.seApresentar();

    return 0;
}
