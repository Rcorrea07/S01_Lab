use std::io;

fn calcular_pontuacao(prova1: f64, prova2: f64, redacao: f64) -> f64 {
    let media_provas = (prova1 + prova2) / 2.0;

    let pontuacao_final = (media_provas * 0.6) + (redacao * 0.4);

    if pontuacao_final >= 60.0 {
        println!("Parabens! Candidato aprovado no processo seletivo.");
    } else {
        println!("Infelizmente o candidato nao atingiu a pontuacao minima de aprovacao.");
    }

    pontuacao_final
}

fn main() {
    let mut nota_digitada1 = String::new();

    println!("Digite a nota da Prova Teorica 1:");
    io::stdin()
        .read_line(&mut nota_digitada1)
        .expect("Erro na leitura");

    let valor1 = nota_digitada1.trim();
    let prova1: f64 = valor1.parse().unwrap_or(0.0);

    let mut nota_digitada2 = String::new();

    println!("Digite a nota da Prova Teorica 2:");
    io::stdin()
        .read_line(&mut nota_digitada2)
        .expect("Erro na leitura");

    let valor2 = nota_digitada2.trim();
    let prova2: f64 = valor2.parse().unwrap_or(0.0);

    let mut nota_redacao = String::new();

    println!("Digite a nota da redacao:");
    io::stdin()
        .read_line(&mut nota_redacao)
        .expect("Erro na leitura");

    let valor_redacao = nota_redacao.trim();
    let redacao: f64 = valor_redacao.parse().unwrap_or(0.0);

    let pontuacao = calcular_pontuacao(prova1, prova2, redacao);

    println!("Pontuacao Final: {}", pontuacao);
}
