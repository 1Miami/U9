package Att2;

import java.util.Scanner;

public class JogoDaVelha {
    private enum EstadoCasa {
        VAZIA, JOGADOR1, JOGADOR2
    }

    private EstadoCasa[][] grade;
    private boolean jogador1Venceu;
    private boolean jogador2Venceu;
    private boolean empate;
    private Scanner scanner;

    public JogoDaVelha() {
        grade = new EstadoCasa[3][3];
        jogador1Venceu = false;
        jogador2Venceu = false;
        empate = false;
        scanner = new Scanner(System.in);

        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                grade[i][j] = EstadoCasa.VAZIA;
            }
        }
    }

    public void exibirGrade() {
        System.out.println("  0 1 2");
        for (int i = 0; i < 3; i++) {
            System.out.print(i + " ");
            for (int j = 0; j < 3; j++) {
                switch (grade[i][j]) {
                    case VAZIA:
                        System.out.print("_ ");
                        break;
                    case JOGADOR1:
                        System.out.print("X ");
                        break;
                    case JOGADOR2:
                        System.out.print("O ");
                        break;
                }
            }
            System.out.println();
        }
    }

    public void jogar() {
        boolean jogador1Turno = true;

        while (!jogador1Venceu && !jogador2Venceu && !empate) {
            exibirGrade();

            int linha, coluna;
            do {
                System.out.println((jogador1Turno ? "Jogador 1 (X)" : "Jogador 2 (O)") + ", digite a linha e a coluna: ");
                linha = scanner.nextInt();
                coluna = scanner.nextInt();
            } while (!movimentoValido(linha, coluna));

            if (jogador1Turno) {
                grade[linha][coluna] = EstadoCasa.JOGADOR1;
                jogador1Venceu = verificaVitoria(EstadoCasa.JOGADOR1);
            } else {
                grade[linha][coluna] = EstadoCasa.JOGADOR2;
                jogador2Venceu = verificaVitoria(EstadoCasa.JOGADOR2);
            }

            empate = verificaEmpate();
            jogador1Turno = !jogador1Turno;
        }

        exibirGrade();

        if (jogador1Venceu) {
            System.out.println("Jogador 1 (X) venceu!");
        } else if (jogador2Venceu) {
            System.out.println("Jogador 2 (O) venceu!");
        } else {
            System.out.println("O jogo terminou em empate.");
        }
    }

    private boolean movimentoValido(int linha, int coluna) {
        return linha >= 0 && linha < 3 && coluna >= 0 && coluna < 3 && grade[linha][coluna] == EstadoCasa.VAZIA;
    }

    private boolean verificaVitoria(EstadoCasa jogador) {
        // Verificar linhas e colunas
        for (int i = 0; i < 3; i++) {
            if ((grade[i][0] == jogador && grade[i][1] == jogador && grade[i][2] == jogador) ||
                (grade[0][i] == jogador && grade[1][i] == jogador && grade[2][i] == jogador)) {
                return true;
            }
        }

        // Verificar diagonais
        if ((grade[0][0] == jogador && grade[1][1] == jogador && grade[2][2] == jogador) ||
            (grade[0][2] == jogador && grade[1][1] == jogador && grade[2][0] == jogador)) {
            return true;
        }

        return false;
    }

    private boolean verificaEmpate() {
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                if (grade[i][j] == EstadoCasa.VAZIA) {
                    return false;
                }
            }
        }
        return true;
    }

    public static void main(String[] args) {
        JogoDaVelha jogo = new JogoDaVelha();
        jogo.jogar();
    }
}
