function contarOcorrencias(tabela, alvo)
    local quantidade = 0

    for posicao = 1, #tabela do
        if tabela[posicao] == alvo then
            quantidade = quantidade + 1
        end
    end

    return quantidade
end


print("Digite a quantidade de elementos (N): ")
local total = tonumber(io.read())

local numeros = {}

for posicao = 1, total do
    print("Digite o elemento " .. posicao .. ":")
    local valor = tonumber(io.read())
    table.insert(numeros, valor)
end


print("Digite o numero X a ser buscado: ")
local numeroBuscado = tonumber(io.read())

local ocorrencias = contarOcorrencias(numeros, numeroBuscado)

print("O numero " .. numeroBuscado .. " aparece " .. ocorrencias .. " vez(es) na tabela")
