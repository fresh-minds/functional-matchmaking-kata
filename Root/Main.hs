import Root.ElectHosts
import Root.Players
import Root.BalancingGames
import Control.Monad.IO.Class

createDeathMatch :: IO ()
createDeathMatch = do 
  putStrLn "Creating a balanced deathmatch\n"
  mapM_ printGameInformation indexedGames
  where
    indexedGames = withIndex $ balancedGames $ defaultPlayers

withIndex :: [a] -> [(Int, a)]
withIndex a = zip [1..length a] a

printGameInformation :: (Int, Game) -> IO ()
printGameInformation (index, game) = do
    putStr $ "Game " ++ show index ++ ": " 
    print game
    putStr "With host: "
    print $ electHost game


main :: IO ()
main = createDeathMatch

