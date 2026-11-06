import java.util.ArrayList;

public class Exercicio02 {
    public static void main(String[] args) {
        ItemDoCardapio cafeGelado = new ItemDoCardapio("Cafe gelado", 450.0);
        ItemDoCardapio curryEspecial = new ItemDoCardapio("Curry especial", 750.0);
        ItemDoCardapio comboPhantom = new ComboLeblanc("Combo Phantom", 1050.0);

        CafeLeblanc cafeteria = new CafeLeblanc();

        cafeteria.adicionar(cafeGelado);
        cafeteria.adicionar(curryEspecial);
        cafeteria.adicionar(comboPhantom);

        cafeteria.mostrarCardapio();
    }
}


class ItemDoCardapio {

    private String nome;
    private double preco;

    public ItemDoCardapio(String nome, double preco) {
        this.nome = nome;
        this.preco = preco;
    }

    public String getNome() {
        return nome;
    }

    public double getPreco() {
        return preco;
    }

    public double precoFinal() {
        return getPreco();
    }
}


class ComboLeblanc extends ItemDoCardapio {

    public ComboLeblanc(String nome, double preco) {
        super(nome, preco);
    }

    @Override
    public double precoFinal() {
        return getPreco() * 0.9;
    }
}


class CafeLeblanc {

    private ArrayList<ItemDoCardapio> cardapio;

    public CafeLeblanc() {
        cardapio = new ArrayList<>();
    }

    public void adicionar(ItemDoCardapio item) {
        cardapio.add(item);
    }

    public void mostrarCardapio() {
        for (ItemDoCardapio produto : cardapio) {
            System.out.println(produto.getNome() + ": " + produto.precoFinal());
        }
    }
}
