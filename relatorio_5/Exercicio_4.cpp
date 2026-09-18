#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    int matriz_solar[5][5];

    // Garante que todas as celulas iniciem inativas (0)
    for (int i = 0; i < 5; i++) {
        for (int j = 0; j < 5; j++) {
            matriz_solar[i][j] = 0;
        }
    }

    int opcao;

    do {
        cout << "\n=== TELEMETRIA DO PAINEL SOLAR ===" << endl;
        cout << "1. Ativar Celula" << endl;
        cout << "2. Ver Mapa da Matriz" << endl;
        cout << "3. Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao; // Entrada feita pelo usuario via compilador

        if (opcao == 1) {
            // Ativar Celula
            int fileira, coluna;
            cout << "\nDigite a fileira (0-4): ";
            cin >> fileira;
            cout << "Digite a coluna (0-4): ";
            cin >> coluna;

            if (fileira < 0 || fileira > 4 || coluna < 0 || coluna > 4) {
                cout << "Erro: fileira/coluna fora do intervalo valido (0 a 4)!" << endl;
            }
            else if (matriz_solar[fileira][coluna] == 0) {
                matriz_solar[fileira][coluna] = 1;
                cout << "Sucesso: Celula solar ativada!" << endl;
            }
            else {
                cout << "Erro: Celula solar ja esta em operacao!" << endl;
            }
        }
        else if (opcao == 2) {
            // Ver Mapa da Matriz (Telemetria do Painel)
            cout << "\n--- Mapa da Matriz Solar ---" << endl;
            for (int i = 0; i < 5; i++) {
                for (int j = 0; j < 5; j++) {
                    cout << "[" << matriz_solar[i][j] << "] ";
                }
                cout << endl;
            }
        }
        else if (opcao == 3) {
            // Relatorio Final (Pos-Menu)
            int ativas = 0;

            for (int i = 0; i < 5; i++) {
                for (int j = 0; j < 5; j++) {
                    if (matriz_solar[i][j] == 1) {
                        ativas++;
                    }
                }
            }

            int inativas = 25 - ativas;
            float percentual = (ativas / 25.0f) * 100.0f;

            cout << fixed << setprecision(2);
            cout << "\n=== RELATORIO FINAL DE OPERACAO ===" << endl;
            cout << "Total de celulas ATIVAS: " << ativas << endl;
            cout << "Total de celulas INATIVAS: " << inativas << endl;
            cout << "Capacidade Operacional: " << percentual << "%" << endl;
        }
        else {
            cout << "\nOpcao invalida! Tente novamente." << endl;
        }

    } while (opcao != 3); // O laco encerra quando a opcao de sair e selecionada

    return 0;
}
