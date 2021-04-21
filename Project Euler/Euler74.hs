chainL x
      | x == 169    = 3
      | x == 363601 = 3
      | x == 1454   = 3
      | x == 871    = 2
      | x == 45361  = 2
      | x == 872    = 2
      | x == 45362  = 2
      | x == n      = 1
      | otherwise   = 1 + vJumps!!i1!!i2
      where
        n = facAplly x
        i1 = n `div` 1000
        i2 = n `mod` 1000

vals = map chainL [0..]
vJumps = map ($ vals) drops
drops = map drop [0,10^3..]

facAplly x = sum $ map (factorials!!) $ digits x

digits 0 = []
digits x = (mod x 10):(digits (x `div` 10))

factorials = 1:(factorial 1)
factorial x = (x*factorials!!(x-1)):(factorial $ x+1)
answer = foldl (\acc x-> if(x == 60) then acc+1 else acc) 0 $ take (10^6) vals
