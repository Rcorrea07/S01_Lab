#include <iostream>
using namespace std;

// Funcao recursiva: retorna o total de cenarios de confrontos possiveis
// para uma chave eliminatoria de tamanho n.
int combinar_equipes(int n) {
    if (n == 0) return 0;              // Caso base 1
    if (n == 1) return 1;              // Caso base 2 (grupo unico)
    return combinar_equipes(n - 1) + combinar_equipes(n - 2); // Chamada recursiva
}

int main() {
    int n;

    cout << "Digite o tamanho do chaveamento (n): ";
    cin >> n; // Entrada feita pelo usuario via compilador

    int total = combinar_equipes(n);

    cout << "Total de cenarios de confrontos possiveis: " << total << endl;

    return 0;
}
