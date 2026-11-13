data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)


data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor   :: Double
  , etapa   :: Etapa
  }


descrever :: Atendimento -> String
descrever a = cliente a ++ " | " ++ servico a ++ " | " ++ show (etapa a)


concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }


arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))


main :: IO ()
main = do
  let semRosto =
        Atendimento { cliente = "Sem Rosto", servico = "Banho de ervas", valor = 50.0, etapa = NaFila }
  let espiritoDoRio =
        Atendimento { cliente = "Espirito do Rio", servico = "Banho completo", valor = 120.0, etapa = NoBanho }
  let deusRabanete =
        Atendimento { cliente = "Deus Rabanete", servico = "Banho quente", valor = 80.0, etapa = NaFila }

  let atendimentos = [semRosto, espiritoDoRio, deusRabanete]
  let atualizados = [semRosto, concluir espiritoDoRio, concluir deusRabanete]

  putStrLn "--- Lista original ---"
  mapM_ putStrLn (map descrever atendimentos)
  putStrLn ("Arrecadado: " ++ show (arrecadado atendimentos))

  putStrLn "--- Lista atualizada ---"
  mapM_ putStrLn (map descrever atualizados)
  putStrLn ("Arrecadado: " ++ show (arrecadado atualizados))
