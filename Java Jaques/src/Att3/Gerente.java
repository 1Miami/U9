package Att3;

public class Gerente extends Usuario {
    private String setor;

    public Gerente(String nome, int ID, String cargo, String setor) {
        super(nome, ID, cargo);
        this.setor = setor;
    }
@Override    
         public void imprimirDetalhes() {
        super.imprimirDetalhes();
        System.out.println("Setor: " + setor);
    }
}

    
