function filtrarMaiores(tabela, limite)
    local filtrados = {}

    for posicao = 1, #tabela do
        if tabela[posicao] > limite then
            table.insert(filtrados, tabela[posicao])
        end
    end

    return filtrados
end


print("Digite a quantidade de elementos (N): ")
local quantidade = tonumber(io.read())

local numeros = {}

for posicao = 1, quantidade do
    print("Digite o elemento " .. posicao .. ": ")
    local valor = tonumber(io.read())
    table.insert(numeros, valor)
end


print("Digite o valor limite (K): ")
local limiteK = tonumber(io.read())


local maiores = filtrarMaiores(numeros, limiteK)

print("--- Elementos maiores que " .. limiteK .. " ---")

for posicao = 1, #maiores do
    print(maiores[posicao])
end
