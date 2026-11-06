import java.util.ArrayList;
import java.util.HashMap;

public class Exercicio03 {
    public static void main(String[] args) {
        Sobrenatural doverDemon = new Alienigena("Dover Demon");
        Sobrenatural acrobaticSilky = new EspiritoYoukai("Acrobatic Silky");

        MapaDeAvistamentos mapaDaCidade = new MapaDeAvistamentos();

        mapaDaCidade.registrar("Ponte do rio", doverDemon);
        mapaDaCidade.registrar("Patio da escola", acrobaticSilky);

        ArrayList<String> locais = new ArrayList<>();
        locais.add("Ponte do rio");
        locais.add("Patio da escola");
        locais.add("Biblioteca");

        for (String lugar : locais) {
            mapaDaCidade.investigar(lugar);
        }
    }
}


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
        System.out.println(nome + " emite uma luz estranha e paralisa quem esta por perto.");
    }
}


class EspiritoYoukai implements Sobrenatural {

    private String nome;

    public EspiritoYoukai(String nome) {
        this.nome = nome;
    }

    @Override
    public void manifestar() {
        System.out.println(nome + " flutua pelo local e sussurra o nome de quem chegou.");
    }
}


class MapaDeAvistamentos {

    private HashMap<String, Sobrenatural> avistamentos;

    public MapaDeAvistamentos() {
        avistamentos = new HashMap<>();
    }

    public void registrar(String local, Sobrenatural ser) {
        avistamentos.put(local, ser);
    }

    public void investigar(String local) {
        Sobrenatural encontrado = avistamentos.get(local);

        if (encontrado != null) {
            encontrado.manifestar();
        } else {
            System.out.println("O local " + local + " esta tranquilo.");
        }
    }
}
