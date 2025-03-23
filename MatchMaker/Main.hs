  import ElectHosts
  import Players
  import BalancingGames

  createDeathMatch :: IO ()
  createDeathMatch = do 
    print "Creating a balanced deathmatch"
    mapM_ printGameInformation (balancedGames players)

  printGameInformation :: Game -> IO ()
  printGameInformation game = do
    print "Game:"
    print game
    print $ "With host: " ++ (show $ electHost game)
    print ""

