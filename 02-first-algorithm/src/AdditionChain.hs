module AdditionChain where

import GHC.Natural (Natural)

-- multiply by 1 via addition chain
m1 :: Natural -> Natural -- 0
m1 a = a

m2 :: Natural -> Natural -- 1
m2 a = a + a

m3 :: Natural -> Natural -- 2
m3 a = a + a + a

m4 :: Natural -> Natural -- 2
m4 a =
    let b = a + a
     in b + b

m5 :: Natural -> Natural -- 3
m5 a =
    let b = a + a
     in b + b + a

m6 :: Natural -> Natural -- 3
m6 a =
    let b = a + a + a
     in b + b

m7 :: Natural -> Natural -- 3
m7 a =
    let b = a + a + a
     in b + b + a

m8 :: Natural -> Natural -- 3
m8 a =
    let b = a + a
        c = b + b
     in c + c

m9 :: Natural -> Natural -- 4
m9 a =
    let b = a + a
        c = b + b
     in c + c + a

m10 :: Natural -> Natural -- 4
m10 a =
    let b = a + a
        c = b + b
     in c + c + b

m11 :: Natural -> Natural -- 6
m11 a =
    let b = a + a + a
        c = a + a
     in b + b + b + c

m12 :: Natural -> Natural -- 4
m12 a =
    let b = a + a + a
        c = b + b
     in c + c

m13 :: Natural -> Natural -- 5
m13 a =
    let b = a + a + a
        c = b + b
     in c + c + a

m14 :: Natural -> Natural -- 6
m14 a =
    let b = a + a + a
        c = b + b
     in c + c + a + a

m15 :: Natural -> Natural -- 5
m15 a =
    let b = a + a + a
        c = b + b
     in c + c + b

m16 :: Natural -> Natural -- 4
m16 a =
    let b = a + a
        c = b + b
        d = c + c
     in d + d
