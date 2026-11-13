data Cafe = Cafe String Double Int

descrever :: Cafe -> String
descrever (Cafe nome preco _) = nome ++ " - R$ " ++ show preco

forca :: Cafe -> String
forca (Cafe _ _ intensidade)
  | intensidade >= 8 = "Forte"
  | intensidade >= 5 = "Equilibrado"
  | otherwise        = "Suave"

precoDoPedido :: Bool -> Cafe -> Double
precoDoPedido leite (Cafe _ preco _) =
  if leite
    then preco + 2.0
    else preco

main :: IO ()
main = do
  let blendNegro = Cafe "Blend Negro" 14.5 9
  let casaLeblanc = Cafe "Casa Leblanc" 11.0 6
  let suaveTokyo = Cafe "Suave Tokyo" 9.0 3

  putStrLn "--- Cafes do dia ---"
  putStrLn (descrever blendNegro)
  putStrLn ("Forca: " ++ forca blendNegro)
  putStrLn (descrever casaLeblanc)
  putStrLn ("Forca: " ++ forca casaLeblanc)
  putStrLn (descrever suaveTokyo)
  putStrLn ("Forca: " ++ forca suaveTokyo)

  putStrLn "--- Preco do Casa Leblanc ---"
  print (precoDoPedido True casaLeblanc)
  print (precoDoPedido False casaLeblanc)
