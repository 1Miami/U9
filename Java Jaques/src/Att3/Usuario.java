package Att3;

public abstract class Usuario {
    private String nome;
    private int ID;
    private String cargo;

    public Usuario(String nome, int ID, String cargo) {
        this.nome = nome;
        this.ID = ID;
        this.cargo = cargo;
    }

    public String getNome() {
        return nome;
    }
    
    public void imprimirDetalhes() {
        System.out.println("Nome: " + nome);
        System.out.println("ID: " + ID);
        System.out.println("Cargo: " + cargo);
    }
}
    

