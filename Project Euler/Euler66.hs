nStepSqrt x n = div (x+(div n x)) 2
sqrt'' x n
        | nS==x     = x
        | nS==(x+1) = x
        | otherwise = sqrt'' nS n
        where
          nS = nStepSqrt x n

sqrt' = sqrt'' 1

nStepFrac i v d r = a':(nStepFrac i v d' r')
      where
        d' = (i-r^2) `div` d
        a' = (v-r) `div` d'
        r' = 0-r-a'*d'

fracExpand i = v:a:nStepFrac i v d r
      where
        v = sqrt' i
        d = i - (v^2)
        a = ((2*v) `div` d)
        r = v-a*d

zip' (x:xs) y = (x y):(zip' xs y)
v = map take [1..]

evalFrac [] = [0,1]
evalFrac (x:xs) = [(q!!1),x*(q!!1)+(q!!0)]
          where
            q = evalFrac xs

smallX d = (d,smallX' a d)
      where
        e = fracExpand d
        r = zip' v e
        a = map evalFrac r

smallX' (a:as) d
      | x^2-d*y^2==1 = x
      | otherwise    = smallX' as d
      where
        y = a!!0
        x = a!!1

vals = map smallX (filter (\x->x/=sqrt'(x)^2) [1..1000])
largestValSpot _ im [] = im
largestValSpot mv im ((a,b):xs)
      | mv<b = largestValSpot b a xs
      | otherwise = largestValSpot mv im xs
answer = largestValSpot (0-1) 1 vals
