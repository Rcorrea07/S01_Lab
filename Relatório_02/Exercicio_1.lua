function gerarTabelaPotencias(inicio, fim, base)
    for exp = inicio, fim do
        local potencia = base ^ exp
        print(base .. " ^ " .. exp .. " = " .. potencia)
    end
end


print("Digite o expoente inicial (M): ")
local valorM = tonumber(io.read())

print("Digite o expoente final (N): ")
local valorN = tonumber(io.read())

print("Digite a base: ")
local numeroBase = tonumber(io.read())


gerarTabelaPotencias(valorM, valorN, numeroBase)
