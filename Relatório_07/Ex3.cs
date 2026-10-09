using System;
using System.Collections.Generic;

public class Grimorio
{
    public string FeiticoFavorito { get; set; } = "Nenhum";

    public void Abrir()
    {
        Console.WriteLine($"\nO grimório se abre no feitiço: {FeiticoFavorito}");
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
        Console.WriteLine($"{Nome} - {Funcao}");
    }
}

public class Maga
{
    public string Nome { get; set; }
    public Grimorio Grimorio { get; private set; }
    private List<Companheiro> _grupo;

    public Maga(string nome)
    {
        this.Nome = nome;
        this.Grimorio = new Grimorio();
        this._grupo = new List<Companheiro>();
    }

    public void Recrutar(Companheiro c)
    {
        this._grupo.Add(c);
    }

    public void MostrarGrupo()
    {
        Console.WriteLine($"\nGrupo de {Nome} ({_grupo.Count} companheiros):");

        foreach (var c in _grupo)
        {
            c.Apresentar();
        }
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Console.WriteLine("=== Jornada de Frieren ===");

        Companheiro fern = new Companheiro("Fern", "Maga Aprendiz");
        Companheiro stark = new Companheiro("Stark", "Guerreiro");

        Maga frieren = new Maga("Frieren");

        frieren.Recrutar(fern);
        frieren.Recrutar(stark);

        frieren.Grimorio.FeiticoFavorito = "Zoltraak";

        frieren.MostrarGrupo();
        frieren.Grimorio.Abrir();

        Console.WriteLine("\n=== Fim da Demonstração ===");
    }
}
