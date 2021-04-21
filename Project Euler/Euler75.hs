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

factor (p:ps) x
      | x `mod` p == 0 = p:(runSearch (divOut p x))
      | x == 1         = []
      | otherwise      = factor ps x
factorsL = ([]):(map (factor primes) [1..])
factorsLL = map ($ factorsL) $ map drop [0,30..]
runSearch x = factorsLL!!j1!!j2
      where
        j1 = x `div` 30
        j2 = x `mod` 30

divOut p x
      | n `mod` p == 0 = divOut p n
      | otherwise      = n
      where
        n = x `div` p
areCoprime n1 n2 = areCoprime' (runSearch n1) (runSearch n2)
areCoprime' [] _ = True
areCoprime' _ [] = True
areCoprime' (f1:f1s) (f2:f2s)
      | f1 == f2  = False
      | f1 >  f2  = areCoprime' (f1:f1s) f2s
      | otherwise = areCoprime' f1s (f2:f2s)
flaten [] = []
flaten (x:xs) = x++(flaten xs)
toMake = map (\x-> (x,filter (areCoprime x) $ takeWhile (<x) [1..])) [2..865]
triplets' = mergeSort $ flaten $ map (takeWhile (<1500000)) $ map tripletMaker toMake
tripletMaker (_,[]) = []
tripletMaker (a,(b:bx))
      | mod a 2 == 1 && mod b 2 == 1 = (  a*(a+b)):(tripletMaker (a,bx))
      | otherwise                    = (2*a*(a+b)):(tripletMaker (a,bx))
triplets = uniq 0 triplets'
uniq _ [] = []
uniq p (x:xs)
      | p == x    =    uniq x xs
      | otherwise = x:(uniq x xs)
doesWork [] f _ = f
doesWork (c:cs) f n
      | c > n          = f
      | n `mod` c /= 0 = doesWork cs f n
      | f == True      = False
      | otherwise      = doesWork cs True n
dups = sortFlatten $ map (\x->[x,2*x..1500000]) triplets
answers = nR (-1) False dups
answer = length answers
fV (a,_,_) = a
sV (_,b,_) = b
tV (_,_,c) = c
mergeSort [] = []
mergeSort [a] = [a]
mergeSort x = mix (mergeSort (take s x)) (mergeSort (drop s x))
    where
      s = (length x) `div` 2

mix a [] = a
mix [] b = b
mix (a:as) (b:bs)
    | a>b       = b:(mix (a:as) bs)
    | a<b       = a:(mix as (b:bs))
    | otherwise = a:b:(mix as bs)
sortFlatten' []  = []
sortFlatten' [a] = [a]
sortFlatten' (a:b:c) = (mix a b):(sortFlatten' c)
sortFlatten [a] = a
sortFlatten a = sortFlatten $ (sortFlatten' a)
nR _ _ [] = []
nR p a (x:xs)
      | p == x    = nR x False xs
      | a         = p:(nR x True xs)
      | otherwise = nR x True xs
