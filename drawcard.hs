import Func 
import Control.Monad
import System.IO
import System.Console.ANSI



draw x y positiony positionx wide color = do 
                setCursorPosition (y+positiony) (x+positionx-18)
                psq Vivid color wide

drawcard r a = do
    let px = 0
    let py = 1 
    let b = 5
    let mul = 30
    card r a b px py mul

card r a b px py mul
  | r == 1   = cardcese1 a b px py mul
  | r == 2   = cardcese2 a b px py mul
  | r == 3   = cardcese3 a b px py mul
  | r == 4   = cardcese4 a b px py mul

cardcese1 a b px py mul = do
        saveCursor
        draw (px+(a*mul)) (py) 0 4 11 White
        draw (px+(a*mul)) (py) 1 4 11 White
        draw (px+(a*mul)) (py) 2 4 3 White
        draw (px+(a*mul)) (py) 2 10 4 Blue
        draw (px+(a*mul)) (py) 2 18 4 White
        draw (px+(a*mul)) (py) 3 4 3 White
        draw (px+(a*mul)) (py) 3 10 4 Blue
        draw (px+(a*mul)) (py) 3 18 4 White
        draw (px+(a*mul)) (py) 4 4 5 White
        draw (px+(a*mul)) (py) 4 14 2 Blue
        draw (px+(a*mul)) (py) 4 18 4 White
        draw (px+(a*mul)) (py) 5 4 5 White
        draw (px+(a*mul)) (py) 5 14 2 Blue
        draw (px+(a*mul)) (py) 5 18 4 White
        draw (px+(a*mul)) (py) 6 4 5 White
        draw (px+(a*mul)) (py) 6 14 2 Blue
        draw (px+(a*mul)) (py) 6 18 4 White
        draw (px+(a*mul)) (py) 7 4 5 White
        draw (px+(a*mul)) (py) 7 14 2 Blue
        draw (px+(a*mul)) (py) 7 18 4 White
        draw (px+(a*mul)) (py) 8 4 5 White
        draw (px+(a*mul)) (py) 8 14 2 Blue
        draw (px+(a*mul)) (py) 8 18 4 White
        draw (px+(a*mul)) (py) 9 4 5 White
        draw (px+(a*mul)) (py) 9 14 2 Blue
        draw (px+(a*mul)) (py) 9 18 4 White
        draw (px+(a*mul)) (py) 10 4 11 White
        draw (px+(a*mul)) (py) 11 4 11 White        
        restoreCursor
cardcese2 a b px py mul = do
        saveCursor
        draw (px+(a*mul)) (py) 0 4 11 White
        draw (px+(a*mul)) (py) 1 4 11 White
        draw (px+(a*mul)) (py) 2 4 2 White
        draw (px+(a*mul)) (py) 2 8 7 Blue
        draw (px+(a*mul)) (py) 2 22 2 White
        draw (px+(a*mul)) (py) 3 4 2 White
        draw (px+(a*mul)) (py) 3 8 7 Blue
        draw (px+(a*mul)) (py) 3 22 2 White
        draw (px+(a*mul)) (py) 4 4 7 White
        draw (px+(a*mul)) (py) 4 18 2 Blue
        draw (px+(a*mul)) (py) 4 22 2 White
        draw (px+(a*mul)) (py) 5 4 2 White
        draw (px+(a*mul)) (py) 5 8 7 Blue
        draw (px+(a*mul)) (py) 5 22 2 White
        draw (px+(a*mul)) (py) 6 4 2 White
        draw (px+(a*mul)) (py) 6 8 7 Blue
        draw (px+(a*mul)) (py) 6 22 2 White
        draw (px+(a*mul)) (py) 7 4 2 White
        draw (px+(a*mul)) (py) 7 8 2 Blue
        draw (px+(a*mul)) (py) 7 12 7 White
        draw (px+(a*mul)) (py) 8 4 2 White
        draw (px+(a*mul)) (py) 8 8 7 Blue
        draw (px+(a*mul)) (py) 8 22 2 White
        draw (px+(a*mul)) (py) 9 4 2 White
        draw (px+(a*mul)) (py) 9 8 7 Blue
        draw (px+(a*mul)) (py) 9 22 2 White
        draw (px+(a*mul)) (py) 10 4 11 White
        draw (px+(a*mul)) (py) 11 4 11 White        
        restoreCursor

cardcese3 a b px py mul = do
        saveCursor
        draw (px+(a*mul)) (py) 0 4 11 White
        draw (px+(a*mul)) (py) 1 4 11 White
        draw (px+(a*mul)) (py) 2 4 2 White
        draw (px+(a*mul)) (py) 2 8 7 Blue
        draw (px+(a*mul)) (py) 2 22 2 White
        draw (px+(a*mul)) (py) 3 4 2 White
        draw (px+(a*mul)) (py) 3 8 7 Blue
        draw (px+(a*mul)) (py) 3 22 2 White
        draw (px+(a*mul)) (py) 4 4 7 White
        draw (px+(a*mul)) (py) 4 18 2 Blue
        draw (px+(a*mul)) (py) 4 22 2 White
        draw (px+(a*mul)) (py) 5 4 2 White
        draw (px+(a*mul)) (py) 5 8 7 Blue
        draw (px+(a*mul)) (py) 5 22 2 White
        draw (px+(a*mul)) (py) 6 4 2 White
        draw (px+(a*mul)) (py) 6 8 7 Blue
        draw (px+(a*mul)) (py) 6 22 2 White
        draw (px+(a*mul)) (py) 7 4 7 White
        draw (px+(a*mul)) (py) 7 18 2 Blue
        draw (px+(a*mul)) (py) 7 22 2 White
        draw (px+(a*mul)) (py) 8 4 2 White
        draw (px+(a*mul)) (py) 8 8 7 Blue
        draw (px+(a*mul)) (py) 8 22 2 White
        draw (px+(a*mul)) (py) 9 4 2 White
        draw (px+(a*mul)) (py) 9 8 7 Blue
        draw (px+(a*mul)) (py) 9 22 2 White
        draw (px+(a*mul)) (py) 10 4 11 White
        draw (px+(a*mul)) (py) 11 4 11 White        
        restoreCursor

cardcese4 a b px py mul = do
        saveCursor
        draw (px+(a*mul)) (py) 0 4 11 White
        draw (px+(a*mul)) (py) 1 4 11 White
        draw (px+(a*mul)) (py) 2 4 2 White
        draw (px+(a*mul)) (py) 2 8 2 Blue
        draw (px+(a*mul)) (py) 2 12 3 White
        draw (px+(a*mul)) (py) 2 18 2 Blue
        draw (px+(a*mul)) (py) 2 22 2 White
        draw (px+(a*mul)) (py) 3 4 2 White
        draw (px+(a*mul)) (py) 3 8 2 Blue
        draw (px+(a*mul)) (py) 3 12 3 White
        draw (px+(a*mul)) (py) 3 18 2 Blue
        draw (px+(a*mul)) (py) 3 22 2 White
        draw (px+(a*mul)) (py) 4 4 2 White
        draw (px+(a*mul)) (py) 4 8 2 Blue
        draw (px+(a*mul)) (py) 4 12 3 White
        draw (px+(a*mul)) (py) 4 18 2 Blue
        draw (px+(a*mul)) (py) 4 22 2 White
        draw (px+(a*mul)) (py) 5 4 2 White
        draw (px+(a*mul)) (py) 5 8 7 Blue
        draw (px+(a*mul)) (py) 5 22 2 White
        draw (px+(a*mul)) (py) 6 4 2 White
        draw (px+(a*mul)) (py) 6 8 7 Blue
        draw (px+(a*mul)) (py) 6 22 2 White
        draw (px+(a*mul)) (py) 7 4 7 White
        draw (px+(a*mul)) (py) 7 18 2 Blue
        draw (px+(a*mul)) (py) 7 22 2 White
        draw (px+(a*mul)) (py) 8 4 7 White
        draw (px+(a*mul)) (py) 8 18 2 Blue
        draw (px+(a*mul)) (py) 8 22 2 White
        draw (px+(a*mul)) (py) 9 4 7 White
        draw (px+(a*mul)) (py) 9 18 2 Blue
        draw (px+(a*mul)) (py) 9 22 2 White
        draw (px+(a*mul)) (py) 10 4 11 White
        draw (px+(a*mul)) (py) 11 4 11 White        
        restoreCursor