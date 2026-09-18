#include <iostream>
#include <iomanip>
using namespace std;

int main() {
    float capacidadeMaxima;
    float cargaAtual = 0.0f; // Peso atual carregado, inicializado em 0.0 kg
    int opcao;

    cout << "Informe a capacidade maxima de carga do drone (kg): ";
    cin >> capacidadeMaxima; // Entrada feita pelo usuario via compilador

    cout << fixed << setprecision(2); // Duas casas decimais para os pesos

    do {
        cout << "\n=== SISTEMA DE CARGA DO DRONE ===" << endl;
        cout << "1. Verificar Carga" << endl;
        cout << "2. Carregar Pacote" << endl;
        cout << "3. Descarregar Pacote" << endl;
        cout << "4. Encerrar Operacao" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        if (opcao == 1) {
            // Verificar Carga Atual
            cout << "\nCarga Atual: " << cargaAtual << " kg / " << capacidadeMaxima << " kg" << endl;
            cout << "Espaco Disponivel: " << (capacidadeMaxima - cargaAtual) << " kg" << endl;
        }
        else if (opcao == 2) {
            // Carregar Pacote
            float peso;
            cout << "\nDigite o peso do pacote a ser carregado (kg): ";
            cin >> peso;

            if (cargaAtual + peso > capacidadeMaxima) {
                cout << "Alerta: Peso maximo de decolagem excedido! Operacao cancelada." << endl;
            } else {
                cargaAtual += peso;
                cout << "Pacote adicionado com sucesso!" << endl;
            }
        }
        else if (opcao == 3) {
            // Descarregar Pacote
            float peso;
            cout << "\nDigite o peso a ser descarregado (kg): ";
            cin >> peso;

            if (peso > cargaAtual) {
                cout << "Alerta: Nao e possivel descarregar mais peso do que o que ja esta carregado!" << endl;
            } else {
                cargaAtual -= peso;
                cout << "Pacote descarregado com sucesso!" << endl;
            }
        }
        else if (opcao == 4) {
            // Encerrar Operacao
            cout << "\nEncerrando sistema de telemetria..." << endl;
        }
        else {
            cout << "\nOpcao invalida! Tente novamente." << endl;
        }

    } while (opcao != 4); // O menu reaparece ate a opcao de encerrar ser escolhida

    return 0;
}
