use std::io;

fn validar_placa(placa: &str) -> bool {
    if placa.len() < 7 {
        return false;
    }

    let mut qtd_letras = 0;
    let mut qtd_numeros = 0;

    for caractere in placa.chars() {
        if caractere.is_ascii_uppercase() {
            qtd_letras = qtd_letras + 1;
        }

        if caractere.is_numeric() {
            qtd_numeros = qtd_numeros + 1;
        }
    }

    if qtd_letras >= 3 && qtd_numeros >= 4 {
        return true;
    } else {
        return false;
    }
}

fn main() {
    loop {
        let mut texto_placa = String::new();

        println!("Digite a placa do veiculo:");
        io::stdin()
            .read_line(&mut texto_placa)
            .expect("Erro na leitura");

        let placa_digitada = texto_placa.trim();

        if validar_placa(placa_digitada) {
            println!("Placa cadastrada no sistema!");
            break;
        } else {
            println!("Placa invalida. Digite novamente!");
        }
    }
}
