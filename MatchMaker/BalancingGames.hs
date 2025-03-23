module BalancingGames where
  import Players
  import Data.List

  {-
   Implement a function that creates games of 2 to 6 players.
   The games should be as balanced as possible, meaning that the deviation of the skill levels per group should be as low as possible.

   Game is a type alias for [Player]

   Some Tips:

   You can use function patterns to get the head and tail of an array. For example the functions head an tail:
    head (x:xs) = x
    tail (x:xs) = xs
   This is especially powerful in combination with recursive functions 

   You should look into the functions take and drop
   
   you might want to create additional functions. See ElectHosts for inspiration.
   -}
  balancedGames :: [Player] -> [Game]
  balancedGames players = error "not implemented"

  {- Write a function that given a list of games, calculates the average skill level per game.
   
   This function is just an extra exercise, it should be required for implementing balancedGames.

   Tips:
   look into sum and div.
   -}
  averageSkillLevels :: [Game] -> [Int]
  averageSkillLevels players = error "not implemented"
