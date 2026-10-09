using System;

// Exercício 1: Encapsulamento e Construtores (Defesa de Minas Tirith)

// todo: ABSTRAÇÃO
// o combatente só guarda o que importa pro registro do cerco:
// nome, povo, posto, círculo e o armamento
public class CombatenteDeGondor
{
    // todo: ENCAPSULAMENTO
    // private set = qualquer um pode LER, mas só a própria classe pode ALTERAR
    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }
    public int Circulo { get; private set; }

    // começa como "Desarmado" e só muda pelo método Equipar()
    public string Armamento { get; private set; } = "Desarmado";

    // todo: CONSTRUTOR
    // roda automaticamente no new e já deixa o objeto em um estado válido
    public CombatenteDeGondor(string nome, string povo, string posto, int circulo)
    {
        this.Nome = nome;
        this.Povo = povo;
        this.Posto = posto;
        this.Circulo = circulo;
        Console.WriteLine($"[Convocação] {Nome} foi convocado(a) para defender o Círculo {Circulo}.");
    }

    // único caminho pra alterar o Armamento de fora da classe
    public void Equipar(string arma)
    {
        this.Armamento = arma;
        Console.WriteLine($"{Nome} equipou: {Armamento}.");
    }

    public void ApresentarUnidade()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine($"Povo: {Povo}");
        Console.WriteLine($"Posto: {Posto}");
        Console.WriteLine($"Círculo: {Circulo}");

        // o armamento só aparece se o combatente estiver armado
        if (Armamento != "Desarmado")
        {
            Console.WriteLine($"Armamento: {Armamento}");
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Cerco a Minas Tirith ===\n");

        CombatenteDeGondor legolas = new CombatenteDeGondor("Legolas", "Elfo", "Arqueiro", 1);
        CombatenteDeGondor pippin = new CombatenteDeGondor("Peregrin Took", "Hobbit", "Guarda da Cidadela", 7);
        CombatenteDeGondor beregond = new CombatenteDeGondor("Beregond", "Homem de Gondor", "Guarda da Cidadela", 6);

        Console.WriteLine();
        legolas.Equipar("Arco dos Galadhrim");
        beregond.Equipar("Lança de Gondor");
        // Pippin fica sem armamento de propósito

        legolas.ApresentarUnidade();
        pippin.ApresentarUnidade();
        beregond.ApresentarUnidade();

        // todo: TESTE DO ENCAPSULAMENTO
        // a linha abaixo dá erro de compilação:
        // error CS0272: The property or indexer 'CombatenteDeGondor.Posto' cannot be used
        // in this context because the set accessor is inaccessible
        // isso acontece porque o set do Posto é private, só a própria classe pode alterar
        // pippin.Posto = "Capitão";

        Console.WriteLine("\n=== Fim do Registro ===");
    }
}
