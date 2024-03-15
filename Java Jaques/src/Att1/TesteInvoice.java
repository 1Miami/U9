package Att1;

public class TesteInvoice {
    public static void main(String[] args) {
        // Criando um objeto Invoice
        Invoice fatura = new Invoice(123, "Teclado", 2, 29.99);

        // Exibindo informações da fatura
        System.out.println("Número do Item: " + fatura.getNumeroItem());
        System.out.println("Descrição do Item: " + fatura.getDescricaoItem());
        System.out.println("Quantidade Comprada: " + fatura.getQuantidadeComprada());
        System.out.println("Preço Unitário: $" + fatura.getPrecoUnitario());
        System.out.println("Valor da Fatura: $" + fatura.getValorFatura());

        // Atualizando a quantidade comprada e o preço unitário
        fatura.setQuantidadeComprada(3);
        fatura.setPrecoUnitario(39.99);

        // Exibindo o valor da fatura atualizado
        System.out.println("\nFatura Atualizada:");
        System.out.println("Valor da Fatura: $" + fatura.getValorFatura());
    }
}
