import java.util.ArrayList;

public class Exercicio01 {
    public static void main(String[] args) {
        Morador markl = new Mago("Markl", "Capa de disfarce");
        Morador calcifer = new DemonioDoFogo("Calcifer");

        ArrayList<Morador> castelo = new ArrayList<>();
        castelo.add(markl);
        castelo.add(calcifer);

        for (Morador habitante : castelo) {
            habitante.apresentar();
        }

        // Morador generico = new Morador("Morador Generico");
    }
}


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
        System.out.println(getNome() + " conhece o feitico " + feitico + ".");
    }
}


class DemonioDoFogo extends Morador {

    public DemonioDoFogo(String nome) {
        super(nome);
    }

    @Override
    public void apresentar() {
        System.out.println(getNome() + " faz o castelo andar!");
    }
}
