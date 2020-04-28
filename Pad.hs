module Pad where
import System.Console.ANSI

data Pad= Pad { color :: Color
                     , x :: Int
                     , y :: Int
                     , linktopad :: Int
                     , num :: Int
                     , ty :: Char
                     , player :: Char
                     } deriving Show
