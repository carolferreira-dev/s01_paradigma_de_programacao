'declaracao de variaveis'
DIM pin_fixo AS INTEGER = 4321
DIM pin_informado AS INTEGER
DIM tentativas AS INTEGER = 0

'entrada de dados'
PRINT "Informe o PIN de acesso: "
INPUT pin_informado

'desenvolvimento'
'continuar o loop até tiver certo'
WHILE pin_informado <> pin_fixo
    PRINT "PIN INVALIDO. TENTE NOVAMENTE."
    
    PRINT "Informe o PIN de acesso: "
    INPUT pin_informado
    
    tentativas = tentativas + 1
WEND

'saida de dados'

PRINT "TRANSACAO AUTORIZADA!"

'fim do codigo'
SLEEP