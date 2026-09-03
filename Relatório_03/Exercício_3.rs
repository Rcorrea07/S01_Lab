use std::io;

fn imprimir_terminados_em(digito: i32, limite_inferior: i32, limite_superior: i32) {
    println!(
        "--- Numeros do intervalo que terminam em {} ---",
        digito
    );

    for valor in limite_inferior..=limite_superior {
        if valor % 10 == digito {
            println!("{}", valor);
        }
    }
}

fn main() {
    let mut texto_digito = String::new();
    let mut texto_inicio = String::new();
    let mut texto_fim = String::new();

    println!("Digite o digito final desejado (0 a 9):");
    io::stdin()
        .read_line(&mut texto_digito)
        .expect("Erro na leitura");

    let digito: i32 = texto_digito.trim().parse().unwrap_or(0);

    println!("Digite o limite inferior:");
    io::stdin()
        .read_line(&mut texto_inicio)
        .expect("Erro na leitura");

    let limite_inferior: i32 = texto_inicio.trim().parse().unwrap_or(0);

    println!("Digite o limite superior:");
    io::stdin()
        .read_line(&mut texto_fim)
        .expect("Erro na leitura");

    let limite_superior: i32 = texto_fim.trim().parse().unwrap_or(0);

    imprimir_terminados_em(digito, limite_inferior, limite_superior);
}
