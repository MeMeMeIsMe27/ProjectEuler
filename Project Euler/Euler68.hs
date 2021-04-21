eval'' x
      | x!!0==m = eval' (rotatate 0 x)
      | x!!1==m = eval' (rotatate 1 x)
      | x!!2==m = eval' (rotatate 2 x)
      | x!!3==m = eval' (rotatate 3 x)
      | x!!4==m = eval' (rotatate 4 x)
      where
        m = minimum (take 5 x)

rotatate c x = map (\y -> x!!(f y)) [0..(l-1)]
      where
        f z = (z+c) `mod` l
        l = length x
turn = rotatate 1
eval' x
      | z'!!0/=z'!!1 = 0
      | z'!!0/=z'!!2 = 0
      | z'!!0/=z'!!3 = 0
      | z'!!0/=z'!!4 = 0
      | otherwise    = q
      where
        z' = map sum z
        q = eval (reverse (flaten z))
        z = map (\a -> [x!!a,x!!(a+5),x!!(al (a+6))]) [0..4]
        al n = if n == 10 then 5 else n
eval [] = 0
eval (x:xs)
      | x == 10   = 10+100*(eval xs)
      | otherwise = x+10*(eval xs)

flaten [] = []
flaten (x:xs) = x++(flaten xs)
spins e xs
      | xs!!0 == e = [xs]
      | otherwise  = xs:(spins e (turn xs))
gen [x] = [[x]]
gen (x:xs) = map (x:) (flaten (map gen r))
      where
        r = spins (xs!!0) (turn xs)
cut (x:xs) = xs
cut' x = map cut x
gen' = zip' (gen [6..10]) (cut' (gen [0..5]))
zip' [] _ = []
zip' (a:as) b = (zip'' a b)++(zip' as b)
zip'' _ [] = []
zip'' a (b:bs) = (a++b):(zip'' a bs)
answer = maximum $ map eval'' gen'
