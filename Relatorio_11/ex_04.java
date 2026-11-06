import java.util.ArrayList;

abstract class Monstro {
    private String nome;

    public Monstro(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract String receita();
}

class Slime extends Monstro {
    public Slime(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Ferver até ficar firme e servir como gelatina com calda de frutas.";
    }
}

class Mandragora extends Monstro {
    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "Fritar em tempura leve e servir com sal.";
    }
}

class Panela {
    private String material;

    public Panela(String material) {
        this.material = material;
    }

    public String getMaterial() {
        return material;
    }
}

class Cozinheiro {
    private String nome;
    private Panela panela;
    private ArrayList<Monstro> ingredientes;

    public Cozinheiro(String nome, String materialDaPanela) {
        this.nome = nome;
        this.panela = new Panela(materialDaPanela);
        this.ingredientes = new ArrayList<>();
    }

    public void adicionarIngrediente(Monstro monstro) {
        ingredientes.add(monstro);
    }

    public void servirBanquete() {
        System.out.println("\nCozinheiro: " + nome + " | Panela de " + panela.getMaterial());
        for (Monstro monstro : ingredientes) {
            System.out.println("- " + monstro.getNome() + ": " + monstro.receita());
        }
    }
}

public class Main {
    public static void main(String[] args) {
        System.out.println("=== Banquete na Masmorra ===");

        Slime slime = new Slime("Slime Verde");
        Mandragora mandragora = new Mandragora("Mandrágora Gritona");

        Cozinheiro senshi = new Cozinheiro("Senshi", "ferro");
        senshi.adicionarIngrediente(slime);
        senshi.adicionarIngrediente(mandragora);

        senshi.servirBanquete();

        // Composição: a Panela é criada dentro do construtor do Cozinheiro, então ela pertence a ele e só existe junto com ele.
        // Agregação: o Slime e a Mandrágora foram criados antes, fora do Cozinheiro, e ele só guarda a referência deles na lista.
    }
}
