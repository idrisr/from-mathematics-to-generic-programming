module Main where

import Test.Tasty
import MultiplyTest

tests :: TestTree
tests =
    testGroup
        "Main"
        [ multTests
        ]

main :: IO ()
main = defaultMain tests
