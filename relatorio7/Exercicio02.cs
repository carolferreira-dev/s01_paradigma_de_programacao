using System;
using System.Collections.Generic;

// Exercício 2: Herança e Polimorfismo (Batalha de Exibição Pokémon)

// todo: CLASSE BASE
// todo Pokémon tem espécie e nível, as classes filhas herdam daqui
public class Pokemon
{
    public string Especie { get; set; }

    // private set = só a própria classe altera o nível
    public int Nivel { get; private set; }

    public Pokemon(string especie, int nivel)
    {
        this.Especie = especie;
        this.Nivel = nivel;
    }

    // todo: VIRTUAL
    // permite que as classes filhas reescrevam esse método
    public virtual void EntrarEmCampo()
    {
        Console.WriteLine($"\n--- {Especie} (Nv. {Nivel}) entra em campo! ---");
        Console.WriteLine($"{Especie} usou Investida!");
    }
}

// todo: HERANÇA
// TipoPlanta É UM Pokemon, já nasce com Especie e Nivel
public class TipoPlanta : Pokemon
{
    public string GolpeEspecial { get; set; }

    // repassa especie e nivel pro construtor do pai com : base(...)
    public TipoPlanta(string especie, int nivel, string golpeEspecial) : base(especie, nivel)
    {
        this.GolpeEspecial = golpeEspecial;
    }

    // todo: SOBRESCRITA SEM CHAMAR O PAI
    // aqui o comportamento é totalmente substituído, a Investida nem aparece
    public override void EntrarEmCampo()
    {
        Console.WriteLine($"\n--- {Especie} (Nv. {Nivel}) brota no campo! ---");
        Console.WriteLine($"{Especie} usou {GolpeEspecial}! É super efetivo!");
    }
}

public class TipoEletrico : Pokemon
{
    public int Voltagem { get; private set; }

    public TipoEletrico(string especie, int nivel, int voltagem) : base(especie, nivel)
    {
        this.Voltagem = voltagem;
    }

    // todo: SOBRESCRITA CHAMANDO O PAI (base.EntrarEmCampo())
    // primeiro reaproveita o ataque genérico do pai, depois solta a descarga
    public override void EntrarEmCampo()
    {
        base.EntrarEmCampo();
        Console.WriteLine($"{Especie} liberou uma descarga elétrica de {Voltagem} volts!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Batalha de Exibição Pokémon ===");

        // todo: POLIMORFISMO
        // a lista é do tipo Pokemon, mas guarda objetos das classes filhas também
        List<Pokemon> time = new List<Pokemon>();
        time.Add(new TipoPlanta("Sceptile", 50, "Lâmina de Folha"));
        time.Add(new TipoEletrico("Jolteon", 45, 10000));
        time.Add(new Pokemon("Eevee", 20));

        Console.WriteLine($"Pokémon em campo: {time.Count}");

        // todo: POLIMORFISMO EM AÇÃO
        // o foreach trata todo mundo como Pokemon, mas cada um roda o seu EntrarEmCampo()
        foreach (Pokemon p in time)
        {
            p.EntrarEmCampo();
        }

        Console.WriteLine("\n=== Fim da Batalha ===");
    }
}
