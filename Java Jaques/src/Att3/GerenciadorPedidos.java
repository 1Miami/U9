package Att3;

import java.util.ArrayList;
import java.util.List;

public class GerenciadorPedidos {
    private List<Pedido> pedidos;

    public GerenciadorPedidos() {
        this.pedidos = new ArrayList<>();
    }

    public void adicionarPedido(Pedido pedido) {
        pedidos.add(pedido);
    }

    public void exibirPedidos() {
        for (Pedido pedido : pedidos) {
            System.out.println("Data de Emissao: " + pedido.getDataEmissao());
            System.out.println("Preco: " + pedido.getPreco());
            System.out.println("Tipo de Produto: " + pedido.getTipoProduto());
            System.out.println("Funcionario de Vendas: " + pedido.getFuncionarioVendas().getNome());
            System.out.println();
        }
    }
}
