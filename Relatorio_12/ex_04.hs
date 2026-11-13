data Etapa = NaFila | NoBanho | Concluido
  deriving (Show, Eq)

data Atendimento = Atendimento
  { cliente :: String
  , servico :: String
  , valor   :: Double
  , etapa   :: Etapa
  }

descrever :: Atendimento -> String
descrever a =
  cliente a ++ " | " ++ servico a ++ " | " ++ show (etapa a)

concluir :: Atendimento -> Atendimento
concluir a = a { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
  sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
  let deusDoRio = Atendimento { cliente = "Deus do Rio", servico = "Banho de ervas", valor = 120.0, etapa = NaFila }
  let semRosto = Atendimento { cliente = "Sem-Rosto", servico = "Banho completo", valor = 80.0, etapa = NoBanho }
  let espiritoDaLua = Atendimento { cliente = "Espírito da Lua", servico = "Banho de leite", valor = 95.0, etapa = NaFila }

  let atendimentos = [deusDoRio, semRosto, espiritoDaLua]
  let atualizados = [concluir deusDoRio, concluir semRosto, espiritoDaLua]

  putStrLn "--- Lista original ---"
  mapM_ putStrLn (map descrever atendimentos)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atendimentos))

  putStrLn "--- Lista atualizada ---"
  mapM_ putStrLn (map descrever atualizados)
  putStrLn ("Arrecadado: R$ " ++ show (arrecadado atualizados))
