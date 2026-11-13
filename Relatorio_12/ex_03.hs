data Esboco = Esboco
  { titulo  :: String
  , tecnica :: String
  , horas   :: Int
  }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente []    = "O caderno está vazio."
esbocoMaisRecente (e:_) = titulo e ++ " (" ++ tecnica e ++ ")"

contarEsbocos :: [Esboco] -> Int
contarEsbocos []        = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando []        = 0
horasDesenhando (e:resto) = horas e + horasDesenhando resto

main :: IO ()
main = do
  let caderno =
        [ Esboco { titulo = "Criatura da Floresta", tecnica = "nanquim", horas = 5 }
        , Esboco { titulo = "Ruínas do Templo", tecnica = "grafite", horas = 3 }
        , Esboco { titulo = "Paisagem Sombria", tecnica = "carvão", horas = 8 }
        ]

  putStrLn "--- Caderno ---"
  putStrLn ("Mais recente: " ++ esbocoMaisRecente caderno)
  putStrLn ("Esboços: " ++ show (contarEsbocos caderno))
  putStrLn ("Total de horas: " ++ show (horasDesenhando caderno))

  putStrLn "--- Caderno vazio ---"
  putStrLn ("Mais recente: " ++ esbocoMaisRecente [])

  let novoCaderno = Esboco { titulo = "Torre ao Anoitecer", tecnica = "carvão", horas = 4 } : caderno

  putStrLn "--- Caderno novo ---"
  putStrLn ("Mais recente: " ++ esbocoMaisRecente novoCaderno)
  putStrLn ("Esboços no novo: " ++ show (contarEsbocos novoCaderno))
  putStrLn ("Esboços no anterior: " ++ show (contarEsbocos caderno))

  -- putStrLn (titulo (head []))
