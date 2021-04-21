phi' 1 _ = 1
phi' _ 1 = 1
phi' s x
      | (gCF s x) == 1 = 1+(phi' s (x-1))
      | otherwise      =    phi' s (x-1)
phi s = phi' s (s-1)

gCF a 0 = a
gCF a b = gCF b (mod a b)

phip s = (s,(fromIntegral s)/(fromIntegral (phi s)))
fib' = map fib [0..]
fib 0 = 0
fib 1 = 1
fib x = (fib'!!(x-1))+(fib'!!(x-2))
primes = (primes' 2)
primes' x
      | isPrime x = x:(primes' (x+1))
      | otherwise = primes' (x+1)
isPrime c = isPrime' c 0
isPrime' 2 _ = True
isPrime' 3 _ = True

isPrime' c i
      | c<(n^2)        = True
      | c `mod` n == 0 = False
      | otherwise      = isPrime' c (i+1)
      where
        n = primes!!i
findAnswer i t
        |n>(10^6) = t
        |otherwise            = findAnswer (i+1) n
        where
          n = t*(primes!!i)
answer = findAnswer 0 1
