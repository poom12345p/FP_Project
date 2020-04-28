module Func where

import System.IO
import System.Console.ANSI


-- color :: String -> String
-- color "red" = "\x1b[41m"
-- color "green" = "\x1b[42m"
-- color "yellow" = "\x1b[43m"
-- color "blue" = "\x1b[44m"
-- color "magenta" = "\x1b[45m"
-- color "cyan" = "\x1b[46m"
-- color "white" = "\x1b[47m\x1b[30m"
-- color _ = ""

-- colored :: String -> String -> String
-- colored c s = color c ++ s ++ "\x1b[0m"




psq :: ColorIntensity->Color->Int->IO()
psq c1 c2 i = do
        
         if i > 0
             then
                 do
                    --putStrLn ""
                    setSGR [SetColor Background c1 c2]
                    --cursorUp 1
                    putStr("  ")
                    setSGR [Reset]  -- Reset to default colour scheme
                    psq' c1 c2 (i-1)
             else
                 return()

psq' :: ColorIntensity->Color->Int->IO()
psq' c1 c2 i = do
        if i > 0
                then
                    do
                        setSGR [SetColor Background c1 c2]
                        putStr("  ")
                        setSGR [Reset]  -- Reset to default colour scheme
                        psq' c1 c2 (i-1)
                else
                        return()


drawstar ::Int->Int->IO()
drawstar x y = do
            saveCursor

            -- gotoxy(p.x+4,p.y-6);
            setCursorPosition (y-6) (x+4)
            -- psq(239,1);
            psq Vivid Yellow 1
            -- gotoxy(p.x+8,p.y-6);
            setCursorPosition (y-6) (x+8)
            -- psq(239,1);
            psq Vivid Yellow 1
            -- gotoxy(p.x+12,p.y-6);
            setCursorPosition (y-6) (x+12)
            -- psq(239,1);
            psq Vivid Yellow 1
            --gotoxy(p.x+6,p.y-5);
            setCursorPosition (y-5) (x+6)
            -- psq(239,1);
            psq Vivid Yellow 1
            -- psq(240,1);
            psq Vivid White 1
            -- psq(239,1);
            psq Vivid Yellow 1
            --gotoxy(p.x+4,p.y-4);
            setCursorPosition (y-4) (x+4)
            -- psq(239,1);
            psq Vivid Yellow 1
            -- psq(240,1);
            psq Vivid White 1
            -- psq(239,1);
            psq Vivid Yellow 1
            -- psq(240,1);
            psq Vivid White 1
            -- psq(239,1);
            psq Vivid Yellow 1
            -- gotoxy(p.x+6,p.y-3);
            setCursorPosition (y-3) (x+6)
            -- psq(239,1);
            psq Vivid Yellow 1
            -- psq(240,1);
            psq Vivid White 1
            -- psq(239,1);
            psq Vivid Yellow 1
            -- gotoxy(p.x+4,p.y-2);
            setCursorPosition (y-2) (x+4)
            -- psq(239,1);
            psq Vivid Yellow 1
            -- gotoxy(p.x+8,p.y-2);
            setCursorPosition (y-2) (x+8)
            -- psq(239,1);
            psq Vivid Yellow 1
            -- gotoxy(p.x+12,p.y-2);
            setCursorPosition (y-2) (x+12)
            -- psq(239,1);
            psq Vivid Yellow 1
            restoreCursor


