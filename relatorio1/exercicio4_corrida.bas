'FACA UM PROGRAMA QUE PECA E LEIA:'
'- A DISTANCIA PERCORRIDA EM UM TREINO DE CORRIDA (EM QUILOMETROS)'
'- O TEMO TOTAL GASTO PARA COMPLETAR A CORRIDA (EM MINUTOS)'
'- CALCULE O PACE MEDIO DO CORREDOR (TEMPO GASTO POR QUILOMETRO):'
'PACE = TEMPO/DISTANCIA'
'AO FINAL, EXIBA O VALOR DO PACE MEDIO CALCULADO (EM MIN/KM)'

'declaracao de variaveis'
DIM distancia AS DOUBLE
DIM tempo AS DOUBLE
DIM pace_medio AS DOUBLE

'entrada de dados'
PRINT "Distância (km): "
INPUT distancia

PRINT "Tempo (minutos): "
INPUT tempo

'desenvolvimento'
pace_medio = tempo / distancia

'saida de dados'
PRINT "O pace medio: "; pace_medio; " min/km"

'fim do codigo'
SLEEP