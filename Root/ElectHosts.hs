module Root.ElectHosts where
  import Data.List
  import Root.Players 

  -- This is an example of a function that uses pattern matching
  lowestLatency :: Player -> Player -> Ordering
  lowestLatency (Player _ lat1 _ _ _) (Player _ lat2 _ _ _)
    | lat1 < lat2 = LT
    | lat1 > lat2 = GT
    | otherwise = EQ
    
  {-- 
  Implement a function that returns a player who can host.
  Start with selecting the player with the lowest latency.
  Tip: use the take and sortBy functions.
  
  Then add logic to filter out players who have canHost = False.
  Tip: Use filter and read https://wiki.haskell.org/Anonymous_function 
  --}
  electHost :: [Player] -> [Player]
  electHost [] = [] -- This is type matching on the empty list
  electHost players = players -- todo replace this mock implementation with a real one.


