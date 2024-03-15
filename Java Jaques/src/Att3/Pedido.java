package Att3;

import java.util.Date;

public class Pedido {
    private final Date dataEmissao;
    private final double preco;
    private final TipoProduto tipoProduto;
    private final Usuario funcionarioVendas;

    public Pedido(Date dataEmissao, double preco, TipoProduto tipoProduto, Usuario funcionarioVendas) {
        this.dataEmissao = dataEmissao;
        this.preco = preco;
        this.tipoProduto = tipoProduto;
        this.funcionarioVendas = funcionarioVendas;
    }

    public Date getDataEmissao() {
        return dataEmissao;
    }

    public double getPreco() {
        return preco;
    }

    public TipoProduto getTipoProduto() {
        return tipoProduto;
    }

    public Usuario getFuncionarioVendas() {
        return funcionarioVendas;
    }
    
    public void imprimirDetalhes() {
        System.out.println("Data de Emissao: " + dataEmissao);
        System.out.println("Preco: " + preco);
        System.out.println("Tipo de Produto: " + tipoProduto);
        System.out.println("Funcionario de Vendas:");
        funcionarioVendas.imprimirDetalhes();
    }
}
