convertToTerm x
    | mod x 3 == 0 = (div x 3) * 2
    | otherwise    = 1
eExpansionCut = take 100 $ 2:map convertToTerm [2..]
evalFrac [] = [0,1]
evalFrac (x:xs) = [(q!!1),x*(q!!1)+(q!!0)]
          where
            q = evalFrac xs
sumDigs 0 = 0
sumDigs x = (mod x 10) + sumDigs (div x 10)
answer = sumDigs ((evalFrac eExpansionCut)!!1)
