
module Logogame where
import Control.Monad
import System.IO
import System.Console.ANSI
import Func

draw' x y positiony positionx wide color = do 
                setCursorPosition (y+positiony) (x+positionx)
                psq Vivid color wide

shownamegame sx sy = do 
    saveCursor
    --R
    draw' sx sy 0 0 3 Green
    draw' sx sy 1 0 1 Green
    draw' sx sy 1 5 1 Green
    draw' sx sy 2 0 3 Green
    draw' sx sy 3 0 1 Green
    draw' sx sy 3 5 1 Green
    draw' sx sy 4 0 1 Green
    draw' sx sy 4 5 1 Green
    --O
    draw' sx sy 0 10 2 Magenta
    draw' sx sy 1 9 1 Magenta
    draw' sx sy 1 13 1 Magenta
    draw' sx sy 2 9 1 Magenta
    draw' sx sy 2 13 1 Magenta
    draw' sx sy 3 9 1 Magenta
    draw' sx sy 3 13 1 Magenta
    draw' sx sy 4 10 2 Magenta
    --A
    draw' sx sy 0 18 2 Red
    draw' sx sy 1 17 1 Red
    draw' sx sy 1 21 1 Red
    draw' sx sy 2 17 3 Red
    draw' sx sy 3 17 1 Red
    draw' sx sy 3 21 1 Red
    draw' sx sy 4 17 1 Red
    draw' sx sy 4 21 1 Red
    --D
    draw' sx sy 0 25 3 Blue
    draw' sx sy 1 25 1 Blue
    draw' sx sy 1 30 1 Blue
    draw' sx sy 2 25 1 Blue
    draw' sx sy 2 30 1 Blue
    draw' sx sy 3 25 1 Blue
    draw' sx sy 3 30 1 Blue
    draw' sx sy 4 25 3 Blue
    --T
    draw' sx sy 0 36 4 Magenta
    draw' sx sy 1 39 1 Magenta
    draw' sx sy 2 39 1 Magenta
    draw' sx sy 3 39 1 Magenta
    draw' sx sy 4 39 1 Magenta
    --O
    draw' sx sy 0 47 2 White
    draw' sx sy 1 46 1 White
    draw' sx sy 1 50 1 White
    draw' sx sy 2 46 1 White
    draw' sx sy 2 50 1 White
    draw' sx sy 3 46 1 White
    draw' sx sy 3 50 1 White
    draw' sx sy 4 47 2 White
    --T
    draw' sx sy 0 55 4 Magenta
    draw' sx sy 1 58 1 Magenta
    draw' sx sy 2 58 1 Magenta
    draw' sx sy 3 58 1 Magenta
    draw' sx sy 4 58 1 Magenta
    --H
    draw' sx sy 0 65 1 Red
    draw' sx sy 0 69 1 Red
    draw' sx sy 1 65 1 Red
    draw' sx sy 1 69 1 Red
    draw' sx sy 2 65 3 Red
    draw' sx sy 3 65 1 Red
    draw' sx sy 3 69 1 Red
    draw' sx sy 4 65 1 Red
    draw' sx sy 4 69 1 Red
    --E
    draw' sx sy 0 73 3 Green
    draw' sx sy 1 73 1 Green
    draw' sx sy 2 73 3 Green
    draw' sx sy 3 73 1 Green
    draw' sx sy 4 73 3 Green
    --S
    draw' sx sy 0 83 3 Blue
    draw' sx sy 1 83 1 Blue
    draw' sx sy 2 83 3 Blue
    draw' sx sy 3 87 1 Blue
    draw' sx sy 4 83 3 Blue
    --K
    draw' sx sy 0 91 1 Red
    draw' sx sy 0 97 1 Red
    draw' sx sy 1 91 1 Red
    draw' sx sy 1 95 1 Red
    draw' sx sy 2 91 1 Red
    draw' sx sy 2 93 1 Red
    draw' sx sy 3 91 1 Red
    draw' sx sy 3 95 1 Red
    draw' sx sy 4 91 1 Red
    draw' sx sy 4 97 1 Red
    --Y
    draw' sx sy 0 101 1 White
    draw' sx sy 0 109 1 White
    draw' sx sy 1 101 1 White
    draw' sx sy 1 109 1 White
    draw' sx sy 2 103 1 White
    draw' sx sy 2 107 1 White
    draw' sx sy 3 105 1 White
    draw' sx sy 4 105 1 White
    restoreCursor
showkrop sx sy = do
    saveCursor
    krop sx sy
    krop2 sx sy  
    restoreCursor
krop sx sy = do
    forM_ [0..130] $ \i -> do
        if i `mod` 2 > 0 
            then do 
                draw' sx sy 0 i 1 Red 
                draw' sx sy 10 i 1 Red 
        else do 
                draw' sx sy 0 i 1 Blue
                draw' sx sy 10 i 1 Blue

krop2 sx sy = do
    forM_ [0..10] $ \i -> do
        if i `mod` 2 > 0 
            then do 
                draw' sx sy i 0 1 Red
                draw' sx sy i 130 1 Red  
        else do
                draw' sx sy i 0 1 Blue
                draw' sx sy i 130 1 Blue
logo x y = do --Logo game
    shownamegame (x+10) (y+3)
    showkrop x y

        
