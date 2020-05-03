
import Control.Monad
import System.Console.ANSI
import Data.IORef
import System.IO (hSetBuffering, hSetEcho, stdin, BufferMode(NoBuffering), getChar, hReady)

import Func


main :: IO ()
main = do 
        clearScreen
        comd <-showmeneu 0
        print comd
                

       

menu :: IO Integer
menu = do 
        let comd = 0
        key <- getChar
        putChar(key)
        return 10
showmeneu::Int-> IO Int
showmeneu  c = do
	saveCursor
	
        clearScreen

	-- setcursor(0,0);
	setCursorPosition (0) (0)	
	-- int pX=60,pY=10;
	let pX = 60
	let pY = 10
	-- int chosse=0;
	-- char comd=0;
	-- gotoxy(pX+5,6+pY);
	setCursorPosition (6+pY) (pX+5)
	-- cout<<"W";
	print "W"
	-- gotoxy(pX+5,7+pY);
	setCursorPosition (7+pY) (pX+5)
	-- cout<<"^";
	print "^"
	-- gotoxy(pX-6,pY+8);
	setCursorPosition (pY+8) (pX-6)
	-- psq(160,11);
	psq Vivid Green 11
	-- for(int i=0;i<13;i++)
	forM_ [1..12] $ \n -> do
	-- {
	-- 	gotoxy(pX-6,pY+8+i);
		setCursorPosition (pY+8+(12-n)) (pX-6)
	-- 	psq(160,1);
		psq Vivid Green 1
	-- 	gotoxy(pX+16,pY+8+i);
		setCursorPosition (pY+8+(12-n)) (pX+16)
	-- 	psq(160,1);
		psq Vivid Green 1
	-- }
	
	-- gotoxy(pX-6,pY+20);
	setCursorPosition (pY+20) (pX-6)
	-- psq(160,11);
	psq Vivid Green 11
	-- gotoxy(pX+5,21+pY);
	setCursorPosition (21+pY) (pX+5)
	-- cout<<"v";
	print "v"
	-- gotoxy(pX+5,22+pY);
	setCursorPosition (22+pY) (pX+5)
	-- cout<<"S";
	print "S"
	-- gotoxy(pX-3,25+pY);
	setCursorPosition (25+pY) (pX-3)
	-- cout<<"Press \"Enter\" to submit";
	print "Press \"Enter\" to submit"
	-- while(comd != 13)
	-- {

        setCursorPosition (10+pY) (pX+3)
        print " START "
        setCursorPosition (14+pY) (pX)
        print " HOW TO PLAY "
        setCursorPosition (18+pY) (pX+3)
        print " EXIT "
        if c == 0 
                then
                        do
                        setCursorPosition (10+pY) (pX+3)
                        psq Vivid Yellow 1
                        -- colorit(12);
                        print "START"
                        psq Vivid Yellow 1
                        else if c == 1
                        then 
                            do
                                setCursorPosition (14+pY) (pX)
                                psq Vivid Yellow 1
                                -- colorit(12);
                                print "HOW TO PLAY"
                                psq Vivid Yellow 1
                        else 
                            do
                                setCursorPosition (18+pY) (pX+3)
                                psq Vivid Yellow 1
                               -- colorit(12);
                                print "EXIT"
                                psq Vivid Yellow 1

        restoreCursor
        a <- getChar
        if a == 'w'
                then 
                     showmeneu ((3+(c-1)) `mod` 3)
                else if a == 'w'
                    then 
                      showmeneu ((3+(c+1)) `mod` 3)
                else if a == 's'
                    then 
                      showmeneu ((3+(c+1)) `mod` 3)
                else if a == 'c'
                    then 
                      return c
                else 
                      showmeneu c


                                       

plus:: Int -> Int->Int
plus x y = x+y