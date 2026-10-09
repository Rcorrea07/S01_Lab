using System;
using System.Collections.Generic;

public class Pokemon
{
    public string Especie { get; private set; }
    public int Nivel { get; private set; }

    public Pokemon(string especie, int nivel)
    {
        this.Especie = especie;
        this.Nivel = nivel;
    }

    public virtual void Atacar()
    {
        Console.WriteLine($"\n--- {Especie} (Nv. {Nivel}) ---");
        Console.WriteLine("Usou Investida!");
    }
}

public class TipoPlanta : Pokemon
{
    public TipoPlanta(string especie, int nivel) : base(especie, nivel)
    {
    }

    public override void Atacar()
    {
        Console.WriteLine($"\n--- {Especie} (Nv. {Nivel}) ---");
        Console.WriteLine("Usou Folha Navalha!");
    }
}

public class TipoEletrico : Pokemon
{
    public TipoEletrico(string especie, int nivel) : base(especie, nivel)
    {
    }

    public override void Atacar()
    {
        base.Atacar();
        Console.WriteLine("Soltou uma descarga elétrica!");
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Batalha de Exibição ===");

        List<Pokemon> time = new List<Pokemon>();
        time.Add(new TipoPlanta("Sceptile", 36));
        time.Add(new TipoEletrico("Jolteon", 30));
        time.Add(new Pokemon("Eevee", 12));

        Console.WriteLine($"\n{time.Count} Pokémon em campo.");

        foreach (var p in time)
        {
            p.Atacar();
        }

        Console.WriteLine("\n=== Fim da Demonstração ===");
    }
}
