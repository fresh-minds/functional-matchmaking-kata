import ElectHosts
import Players
import BalancingGames
import Tests
import Test.QuickCheck
import Text.Pretty.Simple 
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
    prettyPrint game
    putStr "With host: "
    prettyPrint $ electHost game


main :: IO ()
main = createDeathMatch

test :: IO ()
test = do
  -- See Tests.hs
  quickCheck prop_first_host_should_have_lowest_latency
  quickCheck prop_games_should_have_max_6_players
  quickCheck prop_games_should_have_min_2_players


prettyPrint  :: (MonadIO m, Show a) => a -> m ()
prettyPrint = pPrintOpt CheckColorTty defaultOutputOptionsLightBg {outputOptionsCompact = True, outputOptionsCompactParens = True}
