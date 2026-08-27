print("Digite o expoente inicial (M):")
local m = tonumber(io.read())

print("Digite o expoente final (N):")
local n = tonumber(io.read())

print("Digite a base:")
local base = tonumber(io.read())

function gerarTabelaPotencias(inicio, fim, base)
    if inicio and fim and base then
        for i = inicio, fim do
            local resultado = base ^ i
            print(base .. "^" .. i .. "=" .. resultado)
        end
    end
end

gerarTabelaPotencias(m, n, base)