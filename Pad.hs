module Pad where
import System.Console.ANSI
import Player

data Pad= Pad { color :: Color
                     , x :: Int
                     , y :: Int
                     , linktopad :: Int
                     , num :: Int
                     , ty :: Char
                     , player :: [Player]
                     } deriving Show

-- newpad:: Int->Int->Char->Int->Int->Int->Pad
-- newpad n l t x y go = 
-- drawpad::Pad-> IO()
-- drawpad p = do
