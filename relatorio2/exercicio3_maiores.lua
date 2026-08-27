print("Digite a quantidade de elementos (N):")
local n_elem = tonumber(io.read())
local tabela_original = {}

if n_elem then
    for i = 1, n_elem do
        print("Digite o elemento " .. i .. ":")
        local elemento = tonumber(io.read())
        table.insert(tabela_original, elemento)
    end
end

print("Digite o valor limite (K):")
local limite_k = tonumber(io.read())

function filtrarMaiores(tabela, limite)
    local nova_tabela = {}
    for i = 1, #tabela do
        if tabela[i] > limite then
            table.insert(nova_tabela, tabela[i])
        end
    end
    return nova_tabela
end

if limite_k then
    local maiores = filtrarMaiores(tabela_original, limite_k)
    print("Elementos maiores que " .. limite_k .. " ---")
    for i = 1, #maiores do
        print(maiores[i])
    end
end