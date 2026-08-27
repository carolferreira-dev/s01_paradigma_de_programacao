-- subfunções
function calcularMedia(a, b)
    return (a + b) / 2
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

-- função principal
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

print("Digite o primeiro número:")
local num1 = tonumber(io.read())

print("Digite o segundo número:")
local num2 = tonumber(io.read())

print("Digite a operacao (\"media\", \"maior\" ou \"diferenca\"):")
local op = io.read()

if num1 and num2 and op then
    local resultado_final = analisarNumeros(num1, num2, op)
    print("Resultado: " .. resultado_final)
end