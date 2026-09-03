use std::io;

fn acertou_o_alvo(palpite: i32, numero_secreto: i32) -> bool {
    let mut distancia = palpite - numero_secreto;

    if distancia < 0 {
        distancia = distancia * -1;
    }

    if distancia <= 5 {
        return true;
    } else {
        return false;
    }
}

fn main() {
    let numero_secreto: i32 = 42;

    loop {
        let mut valor_digitado = String::new();

        println!("Digite seu palpite:");
        io::stdin()
            .read_line(&mut valor_digitado)
            .expect("Erro na leitura");

        let valor_limpo = valor_digitado.trim();
        let palpite: i32 = valor_limpo.parse().unwrap_or(0);

        let resultado = acertou_o_alvo(palpite, numero_secreto);

        if resultado == true {
            let mut diferenca = palpite - numero_secreto;

            if diferenca < 0 {
                diferenca = diferenca * -1;
            }

            println!("Parabens, voce acertou o alvo!");
            println!(
                "Voce ficou a apenas {} unidade(s) do numero secreto ({}).",
                diferenca, numero_secreto
            );

            break;
        } else {
            println!("Voce passou longe! Tente novamente.");
        }
    }
}
