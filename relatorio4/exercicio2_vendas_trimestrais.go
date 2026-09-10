package main

import "fmt"

func main() {
	var t1, t2, t3 int

	fmt.Print("Digite as vendas do 1º trimestre: ")
	fmt.Scanln(&t1)

	fmt.Print("Digite as vendas do 2º trimestre: ")
	fmt.Scanln(&t2)

	fmt.Print("Digite as vendas do 3º trimestre: ")
	fmt.Scanln(&t3)

	total := t1 + t2 + t3

	if total < 100 {
		fmt.Println("Meta mínima anual não atingida!")
	} else {
		fmt.Println("Total de vendas:", total, "unidades")

		switch {
		case total >= 250:
			fmt.Println("Classificação: Categoria Top Seller")
		case total >= 180:
			fmt.Println("Classificação: Categoria Sênior")
		case total >= 100:
			fmt.Println("Classificação: Categoria Pleno")
		}
	}
}