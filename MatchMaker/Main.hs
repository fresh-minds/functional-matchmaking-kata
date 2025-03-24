import ElectHosts
import Players
import BalancingGames
import Tests
import Test.QuickCheck

createDeathMatch :: IO ()
createDeathMatch = do 
  print "Creating a balanced deathmatch"
  mapM_ printGameInformation (balancedGames defaultPlayers)

printGameInformation :: Game -> IO ()
printGameInformation game = do
    print "Game:"
    print game
    print $ "With host: " ++ (show $ electHost game)
    print ""

main :: IO ()
main = createDeathMatch

test :: IO ()
test = do
  -- See Tests.hs
  quickCheck prop_first_host_should_have_lowest_latency
  quickCheck prop_games_should_have_max_6_players
  quickCheck prop_games_should_have_min_2_players

