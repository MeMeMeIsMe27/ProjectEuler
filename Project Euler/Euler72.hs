primes = 2:(primes' 3)
primes' x
      | isPrime x = x:(primes' (x+1))
      | otherwise = primes' (x+1)

isPrime n = n-1 == phis!!n
phi' i p x
      | x<n*n           = if x==1 then 1 else (if n == x then x else x-1)
      | (mod x n) == 0  = (n-p)*(phi' i 0 (x `div` n))
      | otherwise       = phi' (i+1) 1 x
      where
        n = primes!!i

phi = phi' 0 1
phis = map phi [0..]
tailXX (_:_:x) = x
answer = (sum $ take (10^6-1) $ tailXX phis)-1
strt = map (\x->(1,x)) [2..10^6]
