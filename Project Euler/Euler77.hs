pos 1 _ = 0
pos _ 1 = 0
pos m v
      | m>v          = findP v v
      | not (isPrime m) = findP (m-1) v
      | m==v         = 1+(findP (m-1) v)
      | otherwise    = (findP (m) (v-m))+findP (m-1) v
poslh = map pos [1..]
posl = func poslh
func (x:xs) = (map x [1..]):(func xs)
findP m v = posl!!(m-1)!!(v-1)



primes = 2:(primes' 3)
primes' x
      | isPrime x = x:(primes' (x+1))
      | otherwise = primes' (x+1)

isPrime c = isPrime' c primes

isPrime' c (x:xs)
      | c<(x^2)        = True
      | c `mod` x == 0 = False
      | otherwise      = isPrime' c xs

findP' v = findP v v
h = map findP' [1..]
answer = (length (takeWhile (<=5000) h))+1
