'FACA UM PROGRAMA QUE PECA E LEIA UMA QUANTIDADE DE TEMPO EM HORAS'
'CONVERTA ESSE VALOR PARA MINUTOS SEGUNDOS'
'AO FINAL, EXIBA:'
'- O VALOR ORIGINAL EM HORAS'
'- O VALOR EQUIVALENTE EM MINUTOS'
'- O VALOR EQUIVALENTE EM SEGUNDOS'

'declaracao de variaveis'
DIM horas AS DOUBLE
DIM minutos AS DOUBLE
DIM segundos AS DOUBLE

'entrada de dados'
PRINT "Horas: "
INPUT horas

'desenvolvimento'
minutos = horas *  60
segundos = minutos * 60

'saida de dados'
PRINT "Valor original (em horas): "; horas
PRINT "Valor equivalente em minutos: "; minutos
PRINT "Valor equivalente em segundos: "; segundos

'fim do codigo'
SLEEP