package Att3;

public class FuncionarioProducao extends Usuario {
    private Pedido pedidoResponsavel;

    public FuncionarioProducao(String nome, int ID, String cargo, Pedido pedidoResponsavel) {
        super(nome, ID, cargo);
        this.pedidoResponsavel = pedidoResponsavel;
    }

    public Pedido getPedidoResponsavel() {
        return pedidoResponsavel;
    }

    public void imprimirDetalhes() {
        super.imprimirDetalhes();
        if (pedidoResponsavel != null) {
            System.out.println("Pedido Responsavel:");
            System.out.println("Data de Emissao: " + pedidoResponsavel.getDataEmissao());
            System.out.println("Preco: " + pedidoResponsavel.getPreco());
            System.out.println("Tipo de Produto: " + pedidoResponsavel.getTipoProduto());
            System.out.println("Funcionario de Vendas: " + pedidoResponsavel.getFuncionarioVendas().getNome());
        }
    }
}
