module ElectHosts where
  import Data.List
  import Players 

  -- This is an example of a function that uses pattern matching
  lowestLatency :: Player -> Player -> Ordering
  lowestLatency (Player _ lat1 _ _ _) (Player _ lat2 _ _ _)
    | lat1 < lat2 = LT
    | lat1 > lat2 = GT
    | otherwise = EQ
    
  {-- 
  Implement the function that elects a player as host based on their latency.
  Tip: use the lowestLatency, take and sortBy functions.
  --}
  electHost :: [Player] -> [Player]
  electHost [] = [] -- This is type matching on the empty list
  electHost players = error "not Implemented"
