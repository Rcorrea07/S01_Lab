function calcularMedia(a, b)
    local resultadoMedia = (a + b) / 2
    return resultadoMedia
end


function encontrarMaior(a, b)
    if a > b then
        return a
    else
        return b
    end
end


function calcularDiferencaAbsoluta(a, b)
    if a > b then
        return a - b
    else
        return b - a
    end
end


function analisarNumeros(n1, n2, operacao)
    if operacao == "media" then
        return calcularMedia(n1, n2)

    elseif operacao == "maior" then
        return encontrarMaior(n1, n2)

    elseif operacao == "diferenca" then
        return calcularDiferencaAbsoluta(n1, n2)

    else
        return "Operação inválida!"
    end
end


print("Digite o primeiro numero:")
local primeiroValor = tonumber(io.read())

print("Digite o segundo numero:")
local segundoValor = tonumber(io.read())

print("Digite a operacao: media, maior ou diferenca:")
local escolha = io.read()


local resposta = analisarNumeros(primeiroValor, segundoValor, escolha)

if resposta == "Operação inválida!" then
    print(resposta)
else
    print("Resultado: " .. resposta)
end
