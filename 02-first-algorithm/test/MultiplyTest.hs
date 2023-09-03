module MultiplyTest where

import AdditionChain
import GHC.Natural (Natural)
import Multiply
import Test.Tasty
import Test.Tasty.QuickCheck

instance Arbitrary Natural where
    arbitrary = arbitrarySizedNatural

propEquiv :: (Natural -> Natural -> Natural) -> Natural -> Natural -> Bool
propEquiv f a b = f a b == a * b

propCommute :: (Natural -> Natural -> Natural) -> Natural -> Natural -> Bool
propCommute f a b = f a b == f b a

propAssoc :: (Natural -> Natural -> Natural) -> Natural -> Natural -> Natural -> Bool
propAssoc f a b c = f (f a b) c == f a (f b c)

propM :: (Natural -> Natural) -> Natural -> Natural -> Bool
propM f x n = f n == x * n

multTests :: TestTree
multTests =
    testGroup
        "Mult"
        [ assocTests
        , commuteTests
        , equivTests
        ]

equivTests :: TestTree
equivTests =
    testGroup
        "equiv"
        [ testProperty "m0" $ propEquiv m0
        , testProperty "m1" $ propEquiv m1'
        , testProperty "m1" $ propM m1 1
        , testProperty "m2" $ propM m2 2
        , testProperty "m3" $ propM m3 3
        , testProperty "m4" $ propM m4 4
        , testProperty "m5" $ propM m5 5
        , testProperty "m6" $ propM m6 6
        , testProperty "m7" $ propM m7 7
        , testProperty "m8" $ propM m8 8
        , testProperty "m9" $ propM m9 9
        , testProperty "m10" $ propM m10 10
        , testProperty "m11" $ propM m11 11
        , testProperty "m12" $ propM m12 12
        , testProperty "m13" $ propM m13 13
        , testProperty "m14" $ propM m14 14
        , testProperty "m15" $ propM m15 15
        , testProperty "m16" $ propM m16 16
        ]

assocTests :: TestTree
assocTests =
    testGroup
        "assoc"
        [ testProperty "m0" $ propAssoc m0
        , testProperty "m1" $ propAssoc m1'
        ]

commuteTests :: TestTree
commuteTests =
    testGroup
        "commute"
        [ testProperty "m0" $ propCommute m0
        , testProperty "m1" $ propCommute m1'
        ]
