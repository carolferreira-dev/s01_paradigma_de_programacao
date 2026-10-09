using System;
using System.Collections.Generic;

// Exercício 3: Composição e Agregação (O Grimório de Frieren)

/*
 * COMPOSIÇÃO x AGREGAÇÃO no programa:
 *
 * COMPOSIÇÃO (relação forte): Maga -> Grimorio -> Feitico
 *   O Grimorio é criado DENTRO do construtor da Maga, então ele nasce junto com ela
 *   e não existe sem ela. Do mesmo jeito, cada Feitico é criado DENTRO do Grimorio
 *   pelo método Registrar(). Se a Maga deixar de existir, o grimório e os feitiços
 *   vão junto.
 *
 * AGREGAÇÃO (relação fraca): Maga -> Companheiro
 *   Fern e Stark são criados na Main ANTES da Frieren e só depois são recrutados.
 *   A Maga guarda apenas uma referência para eles. Eles continuam existindo por
 *   conta própria (tanto que chamamos stark.Apresentar() direto no final).
 */

public class Feitico
{
    public string Nome { get; set; }

    public Feitico(string nome)
    {
        this.Nome = nome;
    }

    public void Conjurar()
    {
        Console.WriteLine($"  * Conjurando: {Nome}!");
    }
}

public class Grimorio
{
    // todo: COMPOSIÇÃO
    // a lista de feitiços nasce no construtor do grimório
    private List<Feitico> _feiticos;

    public Grimorio()
    {
        this._feiticos = new List<Feitico>();
    }

    // o Feitico é criado AQUI DENTRO, quem chama só passa o nome
    public void Registrar(string nomeFeitico)
    {
        this._feiticos.Add(new Feitico(nomeFeitico));
        Console.WriteLine($"Feitiço '{nomeFeitico}' registrado no grimório.");
    }

    public void ListarFeiticos()
    {
        Console.WriteLine($"\nO grimório possui {_feiticos.Count} feitiço(s):");
        foreach (Feitico f in _feiticos)
        {
            f.Conjurar();
        }
    }
}

public class Companheiro
{
    public string Nome { get; set; }
    public string Funcao { get; set; }

    public Companheiro(string nome, string funcao)
    {
        this.Nome = nome;
        this.Funcao = funcao;
    }

    public void Apresentar()
    {
        Console.WriteLine($"  - {Nome}, {Funcao}");
    }
}

public class Maga
{
    public string Nome { get; set; }

    // todo: COMPOSIÇÃO
    // private set = ninguém de fora troca o grimório da maga
    public Grimorio Grimorio { get; private set; }

    // todo: AGREGAÇÃO
    // lista de referências para companheiros que já existiam antes
    private List<Companheiro> _companheiros;

    public Maga(string nome)
    {
        this.Nome = nome;
        this.Grimorio = new Grimorio(); // nasce junto com a maga
        this._companheiros = new List<Companheiro>();
        Console.WriteLine($"[Maga] {Nome} iniciou sua jornada.");
    }

    public void RecrutarCompanheiro(Companheiro c)
    {
        this._companheiros.Add(c);
        Console.WriteLine($"{c.Nome} entrou para o grupo de {Nome}.");
    }

    public void MostrarGrupo()
    {
        Console.WriteLine($"\nGrupo de {Nome} ({_companheiros.Count} companheiro(s)):");
        foreach (Companheiro c in _companheiros)
        {
            c.Apresentar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Frieren: Além do Fim da Jornada ===\n");

        // agregação: os companheiros existem ANTES da maga
        Companheiro fern = new Companheiro("Fern", "Maga Aprendiz");
        Companheiro stark = new Companheiro("Stark", "Guerreiro");

        Maga frieren = new Maga("Frieren");

        frieren.RecrutarCompanheiro(fern);
        frieren.RecrutarCompanheiro(stark);

        Console.WriteLine();
        frieren.Grimorio.Registrar("Zoltraak");
        frieren.Grimorio.Registrar("Feitiço de fazer flores brotarem");
        frieren.Grimorio.Registrar("Feitiço de detectar mana");

        frieren.MostrarGrupo();
        frieren.Grimorio.ListarFeiticos();

        // Stark continua existindo por conta própria (agregação)
        Console.WriteLine("\nStark se apresentando sozinho:");
        stark.Apresentar();

        Console.WriteLine("\n=== Fim ===");
    }
}
