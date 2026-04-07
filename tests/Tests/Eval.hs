module Tests.Eval (eval_tests) where

import Data.AIG.CompactGraph
import Data.AIG.Interface
import Test.Tasty
import Test.Tasty.HUnit

eval_tests :: [TestTree]
eval_tests =
  [ testCase "and" $
      do
        g <- newCompactGraph
        x <- newInput g
        y <- newInput g
        o <- Data.AIG.Interface.and g x y
        ev <- evaluator g [True, True]
        v <- ev o
        v @?= True

        ev' <- evaluator g [True, False]
        v' <- ev' o
        v' @?= False
  ]
