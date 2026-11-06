import java.util.HashMap;

interface Sobrenatural {
    void manifestar();
}

class Alienigena implements Sobrenatural {
    private String nome;

    public Alienigena(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " surge no céu e sequestra tudo com um feixe de luz.");
    }
}

class EspiritoYoukai implements Sobrenatural {
    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " aparece na escuridão e persegue quem se aproxima.");
    }
}

class MapaDeAvistamentos {
    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        this.avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        System.out.println("\nInvestigando: " + local);
        Sobrenatural ser = avistamentos.get(local);

        if (ser == null) {
            System.out.println("O local está tranquilo.");
        } else {
            ser.manifestar();
        }
    }
}

public class Main {
    public static void main(String[] args) {
        System.out.println("=== Mapa de Avistamentos ===");

        Alienigena serpo = new Alienigena("Serpo");
        EspiritoYoukai turboVovo = new EspiritoYoukai("Turbo Vovó");

        MapaDeAvistamentos mapa = new MapaDeAvistamentos();
        mapa.registrar("Estacionamento da escola", serpo);
        mapa.registrar("Túnel abandonado", turboVovo);

        mapa.investigar("Estacionamento da escola");
        mapa.investigar("Túnel abandonado");
        mapa.investigar("Praça central");
    }
}
