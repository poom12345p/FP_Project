import Func
import Control.Monad
import Data.IORef

import System.IO
import System.Console.ANSI

-- showmeneu :: IO()
showmeneu = do
	saveCursor
	clearScreen

	-- setcursor(0,0);
	setCursorPosition (0) (0)	
	-- int pX=60,pY=10;
	let pX = 60
	let pY = 10
	-- int chosse=0;
	let chosse = 0
	-- char comd=0;
	let comd = 0
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
	comd <- newIORef (23 :: Int)
	let loop = do
    	v <- readIORef comd
        if v == 13
        	then return chosse 
        else 
	-- 	//system("cls");
	-- 	shownamegame(10,6);
	-- 	showkrop(10,4,125,12);
		
	-- 	colorit(15);
	-- 	gotoxy(pX+3,10+pY);
			setCursorPosition (10+pY) (pX+3)	
	-- 	cout<<" START ";
			print " START "

	-- 	gotoxy(pX,14+pY);
			setCursorPosition (14+pY) (pX)
	-- 	cout<<" HOW TO PLAY ";
			print " HOW TO PLAY "
		
	-- 	gotoxy(pX+3,18+pY);
			setCursorPosition (18+pY) (pX+3)
	-- 	cout<<" EXIT ";
			print " EXIT "
		
	-- 	switch(chosse)
	-- 	{
	-- 		case 0:
	-- 		gotoxy(pX+3,10+pY);
	-- 		psq(224,0.5);
	-- 		colorit(12);
	-- 		cout<<"START";
	-- 		psq(224,0.5);s
	-- 		break;
			if chosse == 0 
			 	then
					do
						setCursorPosition (10+pY) (pX+3)
						psq Vivid Yellow 1
						-- colorit(12);
						print "START"
						psq Vivid Yellow 1
	-- 		case 1:
	-- 		gotoxy(pX,14+pY);
	-- 		psq(224,0.5);
	-- 		colorit(12);
	-- 		cout<<"HOW TO PLAY";
	-- 		psq(224,0.5);
	-- 		break;
			else if chosse == 1
				then 
					do
						setCursorPosition (14+pY) (pX)
						psq Vivid Yellow 1
						-- colorit(12);
						print "HOW TO PLAY"
						psq Vivid Yellow 1
	-- 		case 2: 
	-- 		gotoxy(pX+3,18+pY);
	-- 		colorit(12);	
	-- 		psq(224,0.5);
	-- 		colorit(12);
	-- 		cout<<"EXIT";
	-- 		psq(224,0.5);
	-- 		break;
			else 
				setCursorPosition (18+pY) (pX+3)
				psq Vivid Yellow 1
						-- colorit(12);
				print "EXIT"
				psq Vivid Yellow 1
	-- 		default:
	-- 		break;
	-- 	}
	-- 	colorit(15);
	-- 	comd = getch();
			a <- readLn
			writeIORef comd (a)
	-- 	PlaySound(TEXT("sound/menu.wav"),NULL,SND_SYNC);
	-- 	if(comd =='w')chosse--;
			if comd == "w"
				then 
					do
						writeIORef chosse (chosse - 1)
	-- 	else if(comd == 's')chosse++;
			else if comd == "s"
				then 
					do
						writeIORef chosse (chosse - 1)
				else Nothing
	-- 	chosse = (3+(chosse))%3;
			writeIORef chosse ((3+(chosse)) `mod` 3)
			-- let chosse = (3+(chosse)) `mod` 3
	-- }
		loop
	loop
	-- system("cls");
	-- return chosse;
	restoreCursor
	return chosse