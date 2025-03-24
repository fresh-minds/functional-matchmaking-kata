module Tests where
  import Test.QuickCheck
  import ElectHosts
  import BalancingGames
  import Players

  -- A generator for arbitrary (random) Players. To be used in QuickCheck properties (tests).
  instance Arbitrary Player where
    arbitrary = Player <$> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary <*> arbitrary


  -- QuickCheck test for electHost
  prop_first_host_should_have_lowest_latency :: [Player] -> Bool
  prop_first_host_should_have_lowest_latency players = case electHost players of
      [] -> True  -- If no host is found, it's valid behavior
      (h:_) -> all (\p -> latency h <= latency p) players -- The first player should have the lowest latency

  
  prop_games_should_have_max_6_players :: [Player] -> Bool
  prop_games_should_have_max_6_players players = case balancedGames players of
      games -> all ((<= 6) . length) games

  prop_games_should_have_min_2_players :: [Player] -> Bool
  prop_games_should_have_min_2_players players = case balancedGames players of
      games -> all ((>= 2) . length) games



    
