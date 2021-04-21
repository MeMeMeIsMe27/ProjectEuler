pos 1 _ = 1
pos _ 1 = 1
pos m v
      | m>v       = findP v v
      | m==v      = 1+(findP (m-1) v)
      | otherwise = (findP (m) (v-m))+findP (m-1) v
poslh = map pos [1..]
posl = func poslh
func (x:xs) = (map x [1..]):(func xs)
findP m v = posl!!(m-1)!!(v-1)
