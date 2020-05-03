module Cremap where
import Func
import Control.Monad
import System.IO
import System.Console.ANSI
import Map
-- map cremap(){
cremap::Int -> IO Int
cremap chosse = do
    saveCursor
    clearScreen
-- 	//////////////////////////////
-- 	int pX=60,pY=5;
    let pX = 60
    let pY = 5
    setCursorPosition (pY) (pX-1)
-- 	cout<<"Choose map size";
    print "Choose map size"
-- 	gotoxy(pX+5,6+pY);
    setCursorPosition (6+pY) (pX+5)
-- 	cout<<"W";
    print "W"
-- 	gotoxy(pX+5,7+pY);
    setCursorPosition (7+pY) (pX+5)
-- 	cout<<"^";
    print "^"
-- 	gotoxy(pX-6,pY+8);
    setCursorPosition (pY+8) (pX-6)
-- 	psq(160,11);
    psq Vivid Green 12
-- 	for(int i=0;i<17;i++)
-- 	{
    forM_ [1..16] $ \i -> do
-- 		gotoxy(pX-6,pY+8+i);
        setCursorPosition (pY+8+i) (pX-6)
-- 		psq(160,1);
        psq Vivid Green 1
-- 		gotoxy(pX+16,pY+8+i);
        setCursorPosition (pY+8+i) (pX+16)
-- 		psq(160,1);
        psq Vivid Green 1
-- 	}
-- 	gotoxy(pX-6,pY+24);
    setCursorPosition (pY+24) (pX-6)
-- 	psq(160,11);
    psq Vivid Green 11
-- 	gotoxy(pX+5,25+pY);
    setCursorPosition (pY+25) (pX+5)
-- 	cout<<"v";
    print "v"
-- 	gotoxy(pX+5,26+pY);
    setCursorPosition (pY+26) (pX+5)
-- 	cout<<"S";
    print "S"
-- 	gotoxy(pX-3,29+pY);
    setCursorPosition (pY+29) (pX-3)
-- 	cout<<"Press \"Enter\" to submit";
    print "Press \"Enter\" to submit"
    setSGR [SetColor Foreground Vivid White] 
    setSGR [SetColor Background Dull Black]
-- 		gotoxy(pX+3,10+pY);	
    setCursorPosition (pY+10) (pX+3)
-- 		cout<<" Small ";
    print "Small"

    setCursorPosition (pY+14) (pX+1)
-- 		cout<<" Standard ";
    print " Standard "
    setCursorPosition (pY+18) (pX+3)
-- 		cout<<" Standard ";
    print "Large"
    setCursorPosition (pY+22) (pX)
-- -- 		cout<<" Costom Map ";
    print "Costom Map"
    
    if chosse == 0
         then 
             do
                setCursorPosition (pY+10) (pX+3)
                psq Vivid Yellow 1
                print "Small"
                psq Vivid Yellow 1
               
            else if chosse == 1
                    then 
                        do
                            setCursorPosition (pY+14) (pX+1)
                            psq Vivid Yellow 1
                            --setSGR [SetColor Foreground Vivid Red] 
                            --setSGR [SetColor Background Dull Black]
                            print "Standard"
                            psq Vivid Yellow 1
            else if chosse == 2
                    then 
                        do
                            setCursorPosition (pY+18) (pX+3)
                            psq Vivid Yellow 1
                            --setSGR [SetColor Foreground Vivid Red] 
                            --setSGR [SetColor Background Dull Black]
                            print "Large"
                            psq Vivid Yellow 1
                        
            else 
                do
                        setCursorPosition (pY+22) (pX)
                        psq Vivid Yellow 1
                        --setSGR [SetColor Foreground Vivid Red] 
                        --setSGR [SetColor Background Dull Black]
                        print "Costom Map"
                        psq Vivid Yellow 1
    

                    
--     setSGR [SetColor Foreground Vivid White] 
-- 	setSGR [SetColor Background Dull Black]
-- -- 		comd = getch();
    a <- getChar
-- -- 		PlaySound(TEXT("sound/menu.wav"),NULL,SND_SYNC);
-- -- 		if(comd =='w')chosse--;
-- -- 		else if(comd == 's')chosse++;
-- -- 		chosse = (4+(chosse))%4;
    if a == 'w'
            then 
                cremap ((4+(chosse-1)) `mod` 4)
            else if a == 's'
                then 
                    cremap ((4+(chosse+1)) `mod` 4)
            else if a == 'c'
                then
                    return  chosse
            else
                cremap chosse
    
-- 	}
-- customMap::IO Map	
-- customMap = do
--                 clearScreen
--                 pX<-40
--                 pY<- 5
--                 setCursorPosition (pY) (45)

--                 print "Input you map data(number only)"
--                 pY <- 8
--                 setCursorPosition (pY) (pX)
--                 forM_ [1..11] $ \i -> do
--                     setCursorPosition (pY+i) (pX)
-- -- 				psq(0,25);
--                     psq Vivid Black 25
-- --                 if (max-2 < li*4) or (max-2-(li*4) < rd) or (ppl > 12) or (max<19)
-- --                     then
-- --                         do
-- -- -- 				gotoxy(pX+10,pY-2);
-- --                             setCursorPosition (pY-2) (pX+10)
-- -- -- 				colorit(12);
-- --                             setSGR [SetColor Foreground Vivid Red] 
-- -- 	                        setSGR [SetColor Background Dull Black]
				
-- -- -- 				cout<<"*You input wrong data.*";
-- --                             print "*You input wrong data.*"
-- -- -- 				PlaySound(TEXT("sound/randpad.wav"),NULL,SND_SYNC);
-- -- -- 				colorit(15);
-- --                             setSGR [SetColor Foreground Vivid White] 
-- -- 	                        setSGR [SetColor Background Dull Black]
-- -- -- 			}
-- --                     else 
-- --                         return ()
--                 setCursorPosition (pY) (pX)
--                 print "How many pads do you want?"
--                 setCursorPosition (pY+1) (pX)
-- -- 			
--                 setSGR [SetColor Foreground Vivid Red] 
-- 	            setSGR [SetColor Background Dull Black]

--                 print "> "
-- -- 		
--                 setSGR [SetColor Foreground Vivid White] 
-- 	            setSGR [SetColor Background Dull Black]
-- -- 	
--                 max <- read getLine ::Int
--                 setCursorPosition (pY+2) (pX)

--                 print "How many pads do you want per one floor?"

--                 setCursorPosition (pY+3) (pX)

--                 setSGR [SetColor Foreground Vivid Red] 
-- 	            setSGR [SetColor Background Dull Black]

--                 print "> "

--                 setSGR [SetColor Foreground Vivid White] 
-- 	            setSGR [SetColor Background Dull Black]

--                 ppl <- read getLine ::Int


--                 setCursorPosition (pY+4) (pX)

--                 print "How many snake and ladder pads doyou want?"

--                 setCursorPosition (pY+5) (pX)

--                 print "(number of snake pads = number of  ladder pads)"

--                 setCursorPosition (pY+5) (pX)
--                 setSGR [SetColor Foreground Vivid Red] 
-- 	            setSGR [SetColor Background Dull Black]
-- -- 			cout<<"> ";
--                 print "> "
-- -- 			colorit(15);
--                 setSGR [SetColor Foreground Vivid White] 
-- 	            setSGR [SetColor Background Dull Black]
-- -- 			cin>>li;
--                 li <- read getLine ::Int

--                 setCursorPosition (pY+6) (pX)

--                 return (M max ppl li)

-- parseInts :: String -> [Int]
-- parseInts str = map read (words str)