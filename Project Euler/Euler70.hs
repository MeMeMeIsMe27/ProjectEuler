foldl' _ z []     = z
foldl' f z (x:xs) = let z' = z `f` x
                    in seq z' $ foldl' f z' xs

sqrt' = floor.sqrt.fromIntegral


primes = 2:3:(primes' 5)
primes' x
      | isPrime x = x:(primes' (x+1))
      | otherwise = primes' (x+1)
isPrime c = isPrime' c primes $ sqrt' c

isPrime' c (n:nx) sq
      | sq<n           = True
      | c `mod` n == 0 = False
      | otherwise      = isPrime' c nx sq

phi' p (n:ns) x sq
      | sq<n           = if x==1 then 1 else (if n == x then x else x-1)
      | (mod x n) == 0 = (n-p)*((phi' 0 (n:ns) new (sqrt' new)))
      | otherwise      = phi' 1 ns x sq
      where
        new = x `div` n
phi x = phi' 1 primes x $ sqrt' x

digits 0 = []
digits x = (mod x 10):(digits (x `div` 10))

digitCount [] a  = a
digitCount (x:xs) a = digitCount xs (before++(((a!!x)+1):after))
      where
        before = map (a!!) [0..(x-1)]
        after = map (a!!) [(x+1)..9]
digitCountInt x = digitCount (digits x) [0,0,0,0,0,0,0,0,0,0]
digitCountInt' = map digitCountInt [0..]
doesWork x = (digitCountInt x) == (digitCountInt p)
          where
            p = phi x
answer = foldl' func (3,0) [10^7,10^7-1..3]
func acc x
      | p < fst acc && (digitCountInt x) == (digitCountInt ph) = (p,x)
      | otherwise = acc
      where
        ph = phi x
        p = fromIntegral(x)/fromIntegral(ph)
