using System;
using System.Collections.Generic;

public class EntidadeCosmica
{
    public string Nome { get; set; }
    public string Origem { get; set; } = "Desconhecida";

    public EntidadeCosmica(string nome)
    {
        this.Nome = nome;
    }

    public virtual void Manifestar()
    {
        Console.WriteLine($"\n--- {Nome} ---");

        if (Origem != "Desconhecida")
        {
            Console.WriteLine($"Origem: {Origem}");
        }
    }
}

public class Profundo : EntidadeCosmica
{
    public Profundo(string nome) : base(nome)
    {
    }

    public override void Manifestar()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine("Surge das águas escuras de Innsmouth.");
    }
}

public class MiGo : EntidadeCosmica
{
    public MiGo(string nome) : base(nome)
    {
    }

    public override void Manifestar()
    {
        base.Manifestar();
        Console.WriteLine("Bate as asas e zumbe baixinho.");
    }
}

public class Pesquisador
{
    public string Nome { get; set; }
    private List<EntidadeCosmica> _catalogo;

    public Pesquisador(string nome)
    {
        this.Nome = nome;
        this._catalogo = new List<EntidadeCosmica>();
    }

    public void Catalogar(EntidadeCosmica e)
    {
        this._catalogo.Add(e);
    }

    public void LerCatalogo()
    {
        Console.WriteLine($"\n{Nome} leu {_catalogo.Count} relatos:");

        foreach (var e in _catalogo)
        {
            e.Manifestar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Arquivos Proibidos da Miskatonic ===");

        EntidadeCosmica cor = new EntidadeCosmica("A Cor que Caiu do Espaço");
        Profundo profundo = new Profundo("Profundo de Innsmouth");
        MiGo migo = new MiGo("Mi-Go das Montanhas");

        migo.Origem = "Yuggoth";

        Pesquisador armitage = new Pesquisador("Henry Armitage");

        armitage.Catalogar(cor);
        armitage.Catalogar(profundo);
        armitage.Catalogar(migo);

        armitage.LerCatalogo();

        Console.WriteLine("\n=== Fim da Demonstração ===");
    }
}
