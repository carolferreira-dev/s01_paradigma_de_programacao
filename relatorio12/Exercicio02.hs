pesoMaximo :: Double
pesoMaximo = 5.0
-- pesoMaximo = 8.0


data Encomenda = Encomenda
  { destinatario :: String
  , peso         :: Double
  , frete        :: Double
  }


descrever :: Encomenda -> String
descrever e =
  destinatario e ++ " | " ++ show (peso e) ++ " kg | frete R$ " ++ show (frete e)


cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = filter (\e -> peso e <= pesoMaximo) encomendas


totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)


main :: IO ()
main = do
  let encomendas =
        [ Encomenda { destinatario = "Osono", peso = 2.5, frete = 15.0 }
        , Encomenda { destinatario = "Madame", peso = 4.0, frete = 20.0 }
        , Encomenda { destinatario = "Tombo", peso = 7.5, frete = 30.0 }
        , Encomenda { destinatario = "Ursula", peso = 1.2, frete = 10.0 }
        , Encomenda { destinatario = "Relojoeiro", peso = 9.0, frete = 35.0 }
        ]

  let cabem = cabemNaVassoura encomendas

  putStrLn "--- Encomendas do dia ---"
  mapM_ putStrLn (map descrever encomendas)

  putStrLn "--- Cabem na vassoura ---"
  mapM_ putStrLn (map descrever cabem)

  putStrLn ("Total de fretes: R$ " ++ show (totalDeFretes cabem))
