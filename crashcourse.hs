aFunction :: Int -> String -> String -- Declaration, not mandatory, but recommended
aFunction number word = "Hello " ++ word ++ " " ++ show number 

patternMatching :: [Int] -> String
patternMatching [] = "empty"
patternMatching list = "length: " ++ (show $ length list) -- using $ is another way of writing 'show (length list)'

alsoPatternMatching :: Int -> String
alsoPatternMatching number | number == 0 = "null"
                           | number > 0 = "Positive"
                           | otherwise = "Negative" 

usingAWhere :: [Int] -> String
usingAWhere list | listLen == 0 = "empty"
                 | otherwise = "Not empty"
  where listLen = length list

listPatternMatching :: [Int] -> String
listPatternMatching [] = "empty"

