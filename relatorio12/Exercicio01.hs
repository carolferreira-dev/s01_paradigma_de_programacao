data Cafe = Cafe String Double Int -- nome, preco e intensidade


descrever :: Cafe -> String
descrever (Cafe nome preco _) = nome ++ " - R$ " ++ show preco


forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise        = "Suave"


precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido comLeite (Cafe _ preco _) =
  if comLeite
    then preco + 2.0
    else preco


main :: IO ()
main = do
  let blendDaCasa = Cafe "Blend da Casa" 12.0 9
  let kilimanjaro = Cafe "Kilimanjaro" 15.5 6
  let mochaJava   = Cafe "Mocha Java" 10.0 3

  putStrLn "--- Cafes do dia no Leblanc ---"
  putStrLn (descrever blendDaCasa ++ " | " ++ forca blendDaCasa)
  putStrLn (descrever kilimanjaro ++ " | " ++ forca kilimanjaro)
  putStrLn (descrever mochaJava ++ " | " ++ forca mochaJava)

  putStrLn "--- Pedido de Kilimanjaro ---"
  print (precoDoPedido True kilimanjaro)
  print (precoDoPedido False kilimanjaro)
