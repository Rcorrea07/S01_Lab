#include <iostream>
using namespace std;

// Recebe o array de probabilidades e o tamanho do array.
// Retorna a probabilidade conjunta (produto de todas as probabilidades).
float calcular_confiabilidade_sistema(float probabilidades[], int tamanho) {
    float confiabilidade = 1.0f;

    for (int i = 0; i < tamanho; i++) {
        confiabilidade *= probabilidades[i];
    }

    return confiabilidade;
}

int main() {
    int n;

    cout << "Digite a quantidade de componentes do sistema: ";
    cin >> n; // Entrada feita pelo usuario via compilador

    float* probabilidades = new float[n]; // Array criado com o tamanho informado

    for (int i = 0; i < n; i++) {
        cout << "Digite a probabilidade do componente " << (i + 1) << " (ex: 0.95): ";
        cin >> probabilidades[i];
    }

    float confiabilidade = calcular_confiabilidade_sistema(probabilidades, n);

    cout << "\nConfiabilidade total do sistema: " << confiabilidade
         << " (" << (confiabilidade * 100) << "%)" << endl;

    delete[] probabilidades; // Libera a memoria alocada dinamicamente

    return 0;
}
