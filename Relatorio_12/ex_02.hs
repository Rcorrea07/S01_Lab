pesoMaximo :: Double
pesoMaximo = 15.0

-- pesoMaximo = 20.0

data Encomenda = Encomenda
  { destinatario :: String
  , peso         :: Double
  , frete        :: Double
  }

descrever :: Encomenda -> String
descrever e =
  "Para " ++ destinatario e ++ " | " ++ show (peso e) ++ " kg | frete R$ " ++ show (frete e)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas = filter (\e -> peso e <= pesoMaximo) encomendas

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas = sum (map frete encomendas)

main :: IO ()
main = do
  let encomendas =
        [ Encomenda { destinatario = "Osono", peso = 4.5, frete = 12.0 }
        , Encomenda { destinatario = "Tombo", peso = 18.0, frete = 30.0 }
        , Encomenda { destinatario = "Ursula", peso = 7.0, frete = 20.0 }
        , Encomenda { destinatario = "Padaria", peso = 12.5, frete = 15.0 }
        , Encomenda { destinatario = "Pintor", peso = 22.0, frete = 35.0 }
        ]
  let leves = cabemNaVassoura encomendas

  putStrLn "--- Todas as encomendas ---"
  mapM_ putStrLn (map descrever encomendas)
  putStrLn "--- Cabem na vassoura ---"
  mapM_ putStrLn (map descrever leves)
  putStrLn ("Total de fretes: R$ " ++ show (totalDeFretes leves))
