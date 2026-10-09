// Exercício 3: Polimorfismo Dinâmico (Membros do Inatel)

#include <iostream>
#include <string>
using namespace std;

// CLASSE BASE
class MembroInatel {
protected:
    string nome;

public:
    MembroInatel(string n) : nome(n) {}

    // VIRTUAL: habilita a ligação tardia (decidida em tempo de execução)
    virtual void identificar() {
        cout << "Sou " << nome << ", membro do Inatel." << endl;
    }

    // destrutor virtual, já que vamos usar ponteiros da classe base
    virtual ~MembroInatel() {}
};

class Coordenador : public MembroInatel {
private:
    string departamento;

public:
    Coordenador(string n, string d) : MembroInatel(n), departamento(d) {}

    void identificar() override {
        cout << "Sou " << nome << ", coordenador(a) do departamento de " << departamento << "." << endl;
    }
};

class Pesquisador : public MembroInatel {
private:
    string laboratorio;

public:
    Pesquisador(string n, string l) : MembroInatel(n), laboratorio(l) {}

    void identificar() override {
        cout << "Sou " << nome << ", pesquisador(a) do laboratório " << laboratorio << "." << endl;
    }
};

int main() {
    cout << "=== Membros do Inatel ===\n" << endl;

    // POLIMORFISMO DINÂMICO
    // ponteiros do tipo da classe base apontando para objetos das filhas
    MembroInatel* m1 = new Coordenador("Ana", "Engenharia de Computação");
    MembroInatel* m2 = new Pesquisador("Bruno", "CRR - Centro de Referência em Radiocomunicações");
    MembroInatel* m3 = new MembroInatel("Carla");

    // mesma chamada, cada objeto executa a sua própria versão
    m1->identificar();
    m2->identificar();
    m3->identificar();

    delete m1;
    delete m2;
    delete m3;

    return 0;
}
