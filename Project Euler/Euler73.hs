import Data.Bits

gCF' 0 v = if v==1 then True else False
gCF' u 0 = if u==1 then True else False
gCF' u v
      | u>v       = gCF' (divOut (shiftR (u-v) 1)) v
      | u<v       = gCF' (divOut (shiftR (v-u) 1)) u
      | otherwise = if u==1 then True else False
gCF u v
      | uE && vE  = False
      | u'>v'     = gCF' (divOut (u'-v')) v'
      | u'<v'     = gCF' (divOut (v'-u')) u'
      | otherwise = if u'==1 then True else False
      where
        uE = (mod u 2) == 0
        vE = (mod v 2) == 0
        u' = divOut u
        v' = divOut v

divOut :: Int -> Int
divOut x = if mod x 2 == 0 then divOut $ (shiftR x 1) else x

perDenom = map func [5..12000]
answer = sum perDenom

func x = func' x (floor(fromIntegral(x)/3)+1) (floor(fromIntegral(x)/2)+1)
func' x c e
      | c == e    = 0
      | gCF x c   = 1+(func' x (c+1) e)
      | otherwise = func' x (c+1) e
