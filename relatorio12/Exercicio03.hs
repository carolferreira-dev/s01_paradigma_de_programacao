data Esboco = Esboco
  { titulo  :: String
  , tecnica :: String
  , horas   :: Int
  }


esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente []    = "O caderno esta vazio."
esbocoMaisRecente (e:_) = "Mais recente: " ++ titulo e ++ " (" ++ tecnica e ++ ")"


contarEsbocos :: [Esboco] -> Int
contarEsbocos []        = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto


horasDesenhando :: [Esboco] -> Int
horasDesenhando []        = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto


main :: IO ()
main = do
  let caderno =
        [ Esboco { titulo = "Ruinas do Templo Afundado", tecnica = "nanquim", horas = 5 }
        , Esboco { titulo = "Lobo de Tres Olhos", tecnica = "grafite", horas = 3 }
        , Esboco { titulo = "Floresta sob a Neblina", tecnica = "carvao", horas = 4 }
        ]

  putStrLn "--- Caderno ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Esbocos: " ++ show (contarEsbocos caderno))
  putStrLn ("Horas desenhando: " ++ show (horasDesenhando caderno))

  putStrLn "--- Caderno vazio ---"
  putStrLn (esbocoMaisRecente [])

  let cadernoNovo = Esboco { titulo = "Corvo na Torre em Ruinas", tecnica = "nanquim", horas = 2 } : caderno

  putStrLn "--- Caderno novo ---"
  putStrLn (esbocoMaisRecente cadernoNovo)
  putStrLn ("Esbocos: " ++ show (contarEsbocos cadernoNovo))

  putStrLn "--- Caderno anterior ---"
  putStrLn (esbocoMaisRecente caderno)
  putStrLn ("Esbocos: " ++ show (contarEsbocos caderno))

  -- putStrLn (titulo (head []))
