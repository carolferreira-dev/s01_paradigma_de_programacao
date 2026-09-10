package main

import "fmt"

func ValidarCodigoRastreio(codigo string) (bool, string) {
	if len(codigo) == 10 {
		return true, "Código de rastreio registrado no sistema!"
	}
	return false, "Erro: O código de rastreio deve ter exatamente 10 caracteres."
}

func main() {
	var codigo string
	registrado := false

	for !registrado {
		fmt.Print("Digite o código de rastreio: ")
		fmt.Scanln(&codigo)

		ok, mensagem := ValidarCodigoRastreio(codigo)
		fmt.Println(mensagem)
		registrado = ok
	}
}
