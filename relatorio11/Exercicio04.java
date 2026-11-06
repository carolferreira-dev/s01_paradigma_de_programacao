import java.util.ArrayList;

public class Exercicio04 {
    public static void main(String[] args) {
        Monstro slimeAzul = new Slime("Slime Azul");
        Monstro mandragoraDaFloresta = new Mandragora("Mandragora da Floresta");

        ArrayList<Monstro> derrotados = new ArrayList<>();
        derrotados.add(slimeAzul);
        derrotados.add(mandragoraDaFloresta);

        Cozinheiro chefe = new Cozinheiro("Senshi", "Mitril");

        for (Monstro derrotado : derrotados) {
            chefe.adicionarIngrediente(derrotado);
        }

        chefe.servirBanquete();
    }
}


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
        return "ferva com ervas e sirva gelado, como gelatina";
    }
}


class Mandragora extends Monstro {

    public Mandragora(String nome) {
        super(nome);
    }

    @Override
    public String receita() {
        return "asse com sal e sirva como guarnicao";
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
        panela = new Panela(materialDaPanela);
        ingredientes = new ArrayList<>();
    }

    public void adicionarIngrediente(Monstro monstro) {
        ingredientes.add(monstro);
    }

    public void servirBanquete() {
        System.out.println("Cozinheiro: " + nome + " | Panela: " + panela.getMaterial());

        for (Monstro ingrediente : ingredientes) {
            System.out.println(ingrediente.getNome() + ": " + ingrediente.receita() + ".");
        }
    }
}
