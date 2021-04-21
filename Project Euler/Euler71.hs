gCF 0 v = v
gCF u 0 = u
gCF u v
      | uE&&vE    = 2*(gCF (u `div` 2) (v `div` 2))
      | uE        = gCF (u `div` 2) v
      | vE        = gCF u (v `div` 2)
      | u>v       = gCF ((u-v) `div` 2) v
      | u<v       = gCF ((v-u) `div` 2) u
      | otherwise = u
      where
        uE = (mod u 2) == 0
        vE = (mod v 2) == 0
nearestFrac n d b
        | mod b d == 0 = aprox-1
        | otherwise = aprox
        where
          aprox = div (b*n) d
nFrac2o5 = nearestFrac 3 7
nFrac2o5F x = ((fromIntegral(nFrac2o5 x))/fromIntegral(x),div (nFrac2o5 x) divm)
      where
        num = nFrac2o5 x
        divm = gCF num x
answer = maximum $ map nFrac2o5F [2..1000000]
