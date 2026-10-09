using System;

public class CombatenteDeGondor
{
    public string Nome { get; private set; }
    public string Povo { get; private set; }
    public string Posto { get; private set; }
    public string Armamento { get; private set; } = "Desarmado";

    public CombatenteDeGondor(string nome, string povo, string posto)
    {
        this.Nome = nome;
        this.Povo = povo;
        this.Posto = posto;
        Console.WriteLine($"[Gondor] {Nome} foi convocado.");
    }

    public void Equipar(string arma)
    {
        this.Armamento = arma;
    }

    public void ApresentarUnidade()
    {
        Console.WriteLine($"\n--- {Nome} ---");
        Console.WriteLine($"Povo: {Povo}");
        Console.WriteLine($"Posto: {Posto}");

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
        Console.WriteLine("=== Cerco a Minas Tirith ===");

        CombatenteDeGondor legolas = new CombatenteDeGondor("Legolas", "Elfo", "Arqueiro");
        CombatenteDeGondor pippin = new CombatenteDeGondor("Peregrin Took", "Hobbit", "Guarda da Cidadela");
        CombatenteDeGondor boromir = new CombatenteDeGondor("Boromir", "Homem", "Capitão");

        legolas.Equipar("Arco dos Galadhrim");
        boromir.Equipar("Espada de Gondor");

        legolas.ApresentarUnidade();
        pippin.ApresentarUnidade();
        boromir.ApresentarUnidade();

        // pippin.Posto = "Capitão";
        
        Console.WriteLine("\n=== Fim da Demonstração ===");
    }
}
