abstract class Morador {
    private String nome;

    public Morador(String nome) {
        this.nome = nome;
    }

    public String getNome() {
        return nome;
    }

    public abstract void apresentar();
}

class Mago extends Morador {
    private String feitico;

    public Mago(String nome, String feitico) {
        super(nome);
        this.feitico = feitico;
    }

    @Override
    public void apresentar() {
        System.out.println("O mago " + getNome() + " conjura o feitiço: " + feitico);
    }
}

class DemonioDoFogo extends Morador {
    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println(getNome() + " é o demônio do fogo e faz o castelo andar.");
    }
}

public class Main {
    public static void main(String[] args) {
        System.out.println("=== Moradores do Castelo Animado ===");

        Morador howl = new Mago("Howl", "Transformação em pássaro");
        Morador calcifer = new DemonioDoFogo("Calcifer");

        howl.apresentar();
        calcifer.apresentar();

        // Morador qualquer = new Morador("Teste");
    }
}
