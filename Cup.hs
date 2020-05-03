module Cup where

import System.IO
import System.Console.ANSI
import Func



draw x y positiony positionx wide color = do 
                setCursorPosition (y+positiony) (x+positionx-18)
                psq Vivid color wide


winscene x y c = do
            clearScreen
            setCursorPosition (0) (0)
            saveCursor
            draw x y 1 30 15 Yellow
            draw x y 2 30 15 Yellow
            draw x y 3 20 25 Yellow
            draw x y 4 20 1 Yellow
            draw x y 4 30 15 Yellow
            draw x y 4 68 1 Yellow
            draw x y 5 20 1 Yellow
            draw x y 5 30 15 Yellow
            draw x y 5 68 1 Yellow
            draw x y 6 20 1 Yellow
            draw x y 6 30 15 Yellow
            draw x y 6 68 1 Yellow
            draw x y 7 20 1 Yellow
            draw x y 7 30 15 Yellow
            draw x y 7 68 1 Yellow
            draw x y 8 21 1 Yellow
            draw x y 8 30 15 Yellow
            draw x y 8 67 1 Yellow
            draw x y 9 22 1 Yellow
            draw x y 9 30 15 Yellow
            draw x y 9 66 1 Yellow
            draw x y 10 23 1 Yellow
            draw x y 10 30 15 Yellow
            draw x y 10 65 1 Yellow
            draw x y 11 24 4 Yellow
            draw x y 11 30 15 Yellow
            draw x y 11 58 4 Yellow
            draw x y 12 32 13 Yellow
            draw x y 13 34 11 Yellow
            draw x y 14 36 9 Yellow
            draw x y 15 38 7 Yellow
            draw x y 16 41 4 Yellow
            draw x y 17 41 4 Yellow
            draw x y 18 41 4 Yellow
            draw x y 19 41 4 Yellow
            draw x y 20 36 9 Yellow
            draw x y 21 34 11 Yellow
            draw x y 22 32 13 Yellow
            --p
            draw x y 1 77 4 Green
            draw x y 2 77 1 Green
            draw x y 2 85 1 Green
            draw x y 3 77 1 Green
            draw x y 3 85 1 Green
            draw x y 4 77 1 Green
            draw x y 4 85 1 Green
            draw x y 5 77 4 Green
            draw x y 6 77 1 Green
            draw x y 7 77 1 Green
            --l
            draw x y 1 89 1 Green
            draw x y 2 89 1 Green
            draw x y 3 89 1 Green
            draw x y 4 89 1 Green
            draw x y 5 89 1 Green
            draw x y 6 89 1 Green
            draw x y 7 89 1 Green
            --a
            draw x y 2 96 3 Green
            draw x y 3 94 1 Green
            draw x y 3 100 1 Green
            draw x y 4 94 1 Green
            draw x y 4 100 1 Green
            draw x y 5 94 1 Green
            draw x y 5 100 1 Green
            draw x y 6 94 1 Green
            draw x y 6 100 1 Green
            draw x y 7 96 3 Green
            --y
            draw x y 2 104 1 Green
            draw x y 2 110 1 Green
            draw x y 3 104 1 Green
            draw x y 3 110 1 Green
            draw x y 4 104 1 Green
            draw x y 4 110 1 Green
            draw x y 5 104 1 Green
            draw x y 5 110 1 Green
            draw x y 6 104 1 Green
            draw x y 6 110 1 Green
            draw x y 7 106 3 Green
            draw x y 8 110 1 Green
            draw x y 9 110 1 Green
            draw x y 10 106 2 Green
            --e
            draw x y 2 116 3 Green
            draw x y 3 114 1 Green
            draw x y 3 122 1 Green
            draw x y 4 114 1 Green
            draw x y 4 122 1 Green
            draw x y 5 114 1 Green
            draw x y 5 120 1 Green
            draw x y 6 114 1 Green
            draw x y 6 118 1 Green
            draw x y 7 116 4 Green
            --r
            draw x y 2 126 1 Green
            draw x y 2 130 3 Green
            draw x y 3 126 1 Green
            draw x y 3 128 1 Green
            draw x y 4 126 1 Green
            draw x y 5 126 1 Green
            draw x y 6 126 1 Green
            draw x y 7 126 1 Green
            --W
            draw x y 13 90 2 Red
            draw x y 13 106 2 Red
            draw x y 14 90 2 Red
            draw x y 14 106 2 Red
            draw x y 15 90 2 Blue
            draw x y 15 106 2 Blue
            draw x y 16 90 2 Blue
            draw x y 16 106 2 Blue
            draw x y 17 90 2 Magenta
            draw x y 17 98 2 Magenta
            draw x y 17 106 2 Magenta
            draw x y 18 90 2 Magenta
            draw x y 18 98 2 Magenta
            draw x y 18 106 2 Magenta
            draw x y 19 90 2 Cyan
            draw x y 19 94 2 Cyan
            draw x y 19 102 2 Cyan
            draw x y 19 106 2 Cyan
            draw x y 20 90 2 Cyan
            draw x y 20 94 2 Cyan
            draw x y 20 102 2 Cyan
            draw x y 20 106 2 Cyan
            draw x y 21 90 2 White
            draw x y 21 106 2 White
            draw x y 22 90 2 White
            draw x y 22 106 2 White
            --I
            draw x y 13 115 9 Red
            draw x y 14 115 9 Red
            draw x y 15 122 2 Blue
            draw x y 16 122 2 Blue
            draw x y 17 122 2 Magenta
            draw x y 18 122 2 Magenta
            draw x y 19 122 2 Cyan
            draw x y 20 122 2 Cyan
            draw x y 21 115 9 White
            draw x y 22 115 9 White
            --N
            draw x y 13 138 2 Red
            draw x y 13 154 2 Red
            draw x y 14 138 2 Red
            draw x y 14 154 2 Red
            draw x y 15 138 2 Blue
            draw x y 15 142 2 Blue
            draw x y 15 154 2 Blue
            draw x y 16 138 2 Blue
            draw x y 16 142 2 Blue
            draw x y 16 154 2 Blue
            draw x y 17 138 2 Magenta
            draw x y 17 146 2 Magenta
            draw x y 17 154 2 Magenta
            draw x y 18 138 2 Magenta
            draw x y 18 146 2 Magenta
            draw x y 18 154 2 Magenta
            draw x y 19 138 2 Cyan
            draw x y 19 150 2 Cyan
            draw x y 19 154 2 Cyan
            draw x y 20 138 2 Cyan
            draw x y 20 150 2 Cyan
            draw x y 20 154 2 Cyan
            draw x y 21 138 2 White
            draw x y 21 154 2 White
            draw x y 22 138 2 White
            draw x y 22 154 2 White
            --S
            draw x y 13 167 8 Red
            draw x y 14 167 8 Red
            draw x y 15 163 2 Blue
            draw x y 16 163 2 Blue
            draw x y 17 167 6 Magenta
            draw x y 18 167 6 Magenta
            draw x y 19 179 2 Cyan
            draw x y 20 179 2 Cyan
            draw x y 21 163 8 White
            draw x y 22 163 8 White
            winner x y c
            restoreCursor
onewinner x y = do
            saveCursor
            draw x y 0 150 1 White
            draw x y 1 150 1 White
            draw x y 1 148 1 White
            draw x y 2 150 1 White
            draw x y 2 146 1 White
            draw x y 3 150 1 White
            draw x y 3 144 1 White
            draw x y 4 150 1 White
            draw x y 5 150 1 White
            draw x y 6 150 1 White
            draw x y 7 145 6 White
            restoreCursor
twowinner x y = do
            saveCursor
            draw x y 0 148 3 Blue
            draw x y 1  146 1 Blue
            draw x y 1  154 1 Blue
            draw x y 2  154 1 Blue
            draw x y 3  152 1 Blue
            draw x y 4  150 1 Blue
            draw x y 5  148 1 Blue
            draw x y 6  146 1 Blue
            draw x y 7  146 5 Blue
            restoreCursor
threewinner x y = do 
            saveCursor
            draw x y 0 148 3  Yellow
            draw x y 1  146 1 Yellow
            draw x y 1  154 1 Yellow
            draw x y 2  154 1 Yellow
            draw x y 3  154 1 Yellow
            draw x y 4  148 3 Yellow
            draw x y 5  154 1 Yellow
            draw x y 6  154 1 Yellow
            draw x y 7  146 1 Yellow
            draw x y 7  154 1 Yellow
            draw x y 8 148 3 Yellow
            restoreCursor
fourwinner x y  = do
            saveCursor
            draw x y 0  154 1 Magenta
            draw x y 1  152 1 Magenta
            draw x y 1  154 1 Magenta
            draw x y 2  154 1 Magenta
            draw x y 2  150 1 Magenta
            draw x y 3  154 1 Magenta
            draw x y 3  148 1 Magenta
            draw x y 4  146 1 Magenta
            draw x y 4  154 1 Magenta
            draw x y 5  146 6 Magenta
            draw x y 6  154 1 Magenta
            draw x y 7  154 1 Magenta
            restoreCursor

winner x y c 
  | c == 1   = onewinner x y
  | c == 2   = twowinner x y
  | c == 3   = threewinner x y
  | c == 4   = fourwinner x y
            
          
            
            
            
            
            
            
