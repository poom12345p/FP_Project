module Player where
    
import Pad
import System.Console.ANSI

data Player= Player { name :: String
                     , color :: Color
                     , x :: Int
                     , y :: Int
                     , x_stat :: Int
                     , y_stat :: Int
                     , color_b ::  Color
                     , color_f ::  Color
                     , face :: String
                     , maxpad :: Int
                     , num :: Int
                     , no :: Int
                     , pad :: Pad
                     , myturn :: Int
                     } deriving Show
  