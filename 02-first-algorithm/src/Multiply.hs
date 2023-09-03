module Multiply where

import GHC.Natural (Natural)

-- n - 1 additions
m0 :: Natural -> Natural -> Natural
m0 0 _ = 0
m0 _ 0 = 0
m0 1 a = a
m0 n a = m0 (n - 1) a + a
-- n-1 additions

m1' :: Natural -> Natural -> Natural
m1' 0 _ = 0
m1' _ 0 = 0
m1' 1 a = a
m1' n a | even n = m1' (n `div` 2) $ a + a
m1' n a = m1' (n - 1) a + a
-- log2 n

half :: Natural -> Natural
half n = n `div` 2

mult_acc0 :: Natural -> Natural -> Natural -> Natural
mult_acc0 r 1 a = r + a
mult_acc0 r n a | odd n = mult_acc0 (r + a) (half n) $ a + a
mult_acc0 r n a = mult_acc0 r (half n) $ a + a

mult_acc1 :: Natural -> Natural -> Natural -> Natural
mult_acc1 r 1 a = r + a
mult_acc1 r n a =
    let r1 = if odd n then r + a else r
     in mult_acc1 r1 (half n) $ a + a
