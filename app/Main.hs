module Main where

import Pokemon

selectPokemon :: IO Pokemon
selectPokemon = do
  putStrLn "1: Bulbasaur"
  putStrLn "2: Charmander"
  putStrLn "3: Squirtle"
  n <- readLn
  case n of
    1 -> return bulbasaur
    2 -> return charmander
    3 -> return squirtle
    _ -> selectPokemon

showDamage :: Move -> Pokemon -> Pokemon -> IO ()
showDamage move attack defend = do
  let damage = calc move defend
      action = pName attack ++ "'s " ++ mName move
  putStrLn $ action ++ " influcense " ++ show damage ++ " damages!"

main :: IO ()
main = do
  putStrLn "select your pokemon!"
  your <- selectPokemon
  putStrLn "select adversary pokemon!"
  rival <- selectPokemon
  let move = moves your !! 0
  showDamage move your rival
