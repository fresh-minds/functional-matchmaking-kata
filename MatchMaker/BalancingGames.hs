module BalancingGames where
  import Players
  import Data.List

  {-
   Implement a function that creates games min 2 and max 6 players.
   The games should be as balanced as possible, meaning that the deviation of the skill levels per group should be as low as possible.
   When number of total players is < 2, no Games can be created.

   Game is a type alias for [Player]

   Some Tips:

   You can use function patterns to get the head and tail of an array. For example the functions head an tail:
    head (x:xs) = x
    tail (x:xs) = xs
   This is especially powerful in combination with recursive functions 

   You should look into the functions take and drop
   
   You might want to create additional functions. For example for sorting by skill level and for chunking lists.
   -}
  balancedGames :: [Player] -> [Game]
  balancedGames players | size >= 2 = chunk (sortBy highestSkillLevel players) 6
                        | otherwise = []
    where size = length players

  chunk :: [Player] -> Int -> [Game]
  chunk [] _ = []
  chunk players amount  | total <= 6 = [players]
                        | modulo < 2 = take (amount - 1) players : chunk (drop (amount - 1) players) amount
                        | otherwise = take amount players : chunk (drop amount players) amount
    where 
          total = length players
          modulo = mod (length players) amount

  highestSkillLevel :: Player -> Player -> Ordering
  highestSkillLevel (Player _ _ skillLevel1 _ _) (Player _ _ skillLevel2 _ _)
    | skillLevel1 > skillLevel2 = GT
    | skillLevel1 < skillLevel2 = LT
    | otherwise = EQ

  {- Write a function that given a list of games, calculates the average skill level per game.
   
   This function is just an extra exercise, it should be required for implementing balancedGames.

   Tips:
   look into sum and div.
   -}
  averageSkillLevels :: [Game] -> [Int]
  averageSkillLevels [] = []
  averageSkillLevels (x:xs) = div (sum $ getSkillLevels x) (length x) : averageSkillLevels xs

  getSkillLevels :: [Player] -> [Int]
  getSkillLevels (x:xs) = skill x : getSkillLevels xs
  getSkillLevels [] = []
