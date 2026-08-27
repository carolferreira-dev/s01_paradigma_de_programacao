print("Digite a quantidade de elementos (N):")
local n_elementos = tonumber(io.read())
local minha_tabela = {}

if n_elementos then
    for i = 1, n_elementos do
        print("Digite o elemento " .. i .. ":")
        local elemento = tonumber(io.read())
        table.insert(minha_tabela, elemento)
    end
end

print("Digite o número X a ser buscado:")
local x = tonumber(io.read())

function contarOcorrencias(tabela, alvo)
    local contador = 0
    for i = 1, #tabela do
        if tabela[i] == alvo then
            contador = contador + 1
        end
    end
    return contador
end

if x then
    local vezes = contarOcorrencias(minha_tabela, x)
    print("O número " .. x .. " aparece " .. vezes .. " vez(es) na tabela.")
end