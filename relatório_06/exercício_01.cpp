#include <iostream>
#include <string>
using namespace std;

class Banda {
public:
    string nome;
    int integrantes;
    float potenciaSom;
    int energia;

    void duelar(Banda &rival) {
        cout << nome << " esta se apresentando com potencia " << potenciaSom << "!" << endl;
        rival.energia -= potenciaSom;
    }

    void exibirStatus() {
        cout << "Banda: " << nome << endl;
        cout << "Integrantes: " << integrantes << endl;
        cout << "Potencia do som: " << potenciaSom << endl;
        cout << "Energia: " << energia << endl;
        cout << endl;
    }
};

int main() {
    Banda b1;
    Banda b2;

    b1.nome = "Os Trovadores";
    b1.integrantes = 4;
    b1.potenciaSom = 30;
    b1.energia = 100;

    b2.nome = "Eletro Rock";
    b2.integrantes = 5;
    b2.potenciaSom = 25;
    b2.energia = 100;

    b1.duelar(b2);
    b2.duelar(b1);

    cout << endl;
    b1.exibirStatus();
    b2.exibirStatus();

    return 0;
}
