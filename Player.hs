module Player where
    
import Pad
import Func
import System.Console.ANSI

data Player= Player { name :: String
                    --  , color :: Color
                     , xP :: Int
                     , yP :: Int
                     , x_stat :: Int
                     , y_stat :: Int
                     , color_b ::  Color
                     , color_f ::  Color
                     , face0 :: Char
                     , face1 :: Char
                     , maxpadP :: Int
                     , numP :: Int
                     , no :: Int
                     , padP :: Pad
                     , myturn :: Int
                     , walk :: Bool
                     } deriving Show
player1 = Player "p1" 20 20 1 1 Red Blue '>' '<' 10 1 1 myPad 1 True

drawme :: Player -> Int -> IO()
drawme x y P = do
    if (x == 0) and (y == 0)
        then
            do
                setCursorPosition (yP Player) (xP Player)
                psq Vivid (color_b Player) 1
                setCursorPosition ((yP Player)-1) (xP Player)
                psqc Vivid (color_f Player) White (face0 Player)
                psqc Vivid (color_f Player) White (face1 Player)
                setCursorPosition ((yP Player)-2) (xP Player)
                print ("P" + (numP Player))
        else
            setCursorPosition y x
            psq Vivid (color_b Player) 1
            setCursorPosition (y-1) x
            psqc Vivid (color_f Player) White (face0 Player)
            psqc Vivid (color_f Player) White (face1 Player)
            setCursorPosition (y-2) x
            print ("P" + (numP Player))

