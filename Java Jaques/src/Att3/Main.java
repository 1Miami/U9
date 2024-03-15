package Att3;

import java.util.Date;

public class Main {
    public static void main(String[] args) {
        Gerente gerenteFinanceiro = new Gerente("JAO", 1, "Gerente Financeiro", "Financeiro" );
        Pedido pedido1 = new Pedido(new Date(), 100.0, TipoProduto.BANNER, gerenteFinanceiro);
        FuncionarioProducao funcionarioProducao1 = new FuncionarioProducao("Lucas", 4, "Impressor", pedido1);
        
        imprimirDetalhes(gerenteFinanceiro);
        imprimirDetalhes(pedido1);
        imprimirDetalhes(funcionarioProducao1);
    }
    
    public static void imprimirDetalhes(Usuario usuario) {
        usuario.imprimirDetalhes();
        if (usuario instanceof FuncionarioProducao) {
            Pedido pedidoResponsavel = ((FuncionarioProducao) usuario).getPedidoResponsavel();
            if (pedidoResponsavel != null) {
                System.out.println("Pedido Responsavel:");
                imprimirDetalhes(pedidoResponsavel);
            }
        }
    }
    
    public static void imprimirDetalhes(Pedido pedido) {
        pedido.imprimirDetalhes();
    }
}
