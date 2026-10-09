using System;
using System.Collections.Generic;

// Exercício 4: Revisão Geral (Arquivos Proibidos da Miskatonic)

// todo: CLASSE BASE (não abstrata, dá pra criar objetos dela)
public class EntidadeCosmica
{
    public string Nome { get; set; }
    public string Origem { get; set; } = "Desconhecida";

    public EntidadeCosmica(string nome)
    {
        this.Nome = nome;
        Console.WriteLine($"[Registro] Entidade '{Nome}' registrada nos arquivos.");
    }

    // todo: VIRTUAL
    public virtual void Manifestar()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine("Uma presença indescritível se manifesta...");

        // só mostra a origem se ela for conhecida
        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem: {Origem}");
        }
    }
}

// todo: HERANÇA
public class Profundo : EntidadeCosmica
{
    public int Profundidade { get; private set; }

    public Profundo(string nome, int profundidade) : base(nome)
    {
        this.Profundidade = profundidade;
    }

    // todo: SOBRESCRITA SEM CHAMAR O PAI
    public override void Manifestar()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine($"Emerge das águas a {Profundidade} metros de profundidade, perto de Innsmouth.");
    }
}

public class MiGo : EntidadeCosmica
{
    public string Artefato { get; set; }

    public MiGo(string nome, string artefato) : base(nome)
    {
        this.Artefato = artefato;
    }

    // todo: SOBRESCRITA CHAMANDO O PAI (base.Manifestar())
    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine($"Carrega consigo: {Artefato}.");
    }
}

public class Pesquisador
{
    public string Nome { get; set; }

    // todo: COMPOSIÇÃO
    // o catálogo (a lista) nasce no construtor e pertence ao pesquisador
    private List<EntidadeCosmica> _catalogo;

    public Pesquisador(string nome)
    {
        this.Nome = nome;
        this._catalogo = new List<EntidadeCosmica>();
    }

    // todo: AGREGAÇÃO
    // as entidades foram criadas fora e só são referenciadas aqui
    public void Catalogar(EntidadeCosmica e)
    {
        this._catalogo.Add(e);
        Console.WriteLine($"{Nome} catalogou: {e.Nome}");
    }

    public void LerCatalogo()
    {
        Console.WriteLine($"\n=== Catálogo de {Nome} ({_catalogo.Count} relatos) ===");

        // todo: POLIMORFISMO EM AÇÃO
        // cada entidade executa a sua própria versão do Manifestar()
        foreach (EntidadeCosmica e in _catalogo)
        {
            e.Manifestar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Biblioteca da Universidade Miskatonic ===\n");

        Profundo profundo = new Profundo("Profundo de Y'ha-nthlei", 300);

        MiGo migo = new MiGo("Mi-Go", "Cilindro cerebral");
        migo.Origem = "Yuggoth";

        EntidadeCosmica cor = new EntidadeCosmica("A Cor que Caiu do Espaço");

        Console.WriteLine();
        Pesquisador armitage = new Pesquisador("Henry Armitage");
        armitage.Catalogar(profundo);
        armitage.Catalogar(migo);
        armitage.Catalogar(cor);

        armitage.LerCatalogo();

        Console.WriteLine("\n=== Fim dos Arquivos ===");
    }
}
