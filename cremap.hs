import Func
import Control.Monad
import System.IO
import System.Console.ANSI

-- map cremap(){
cremap chosse = do
    saveCursor
    clearScreen
-- 	int max,ppl,li,rd;
    let max = 0
    let ppl = 0
    let li = 0
    let rd = 0
-- 	//////////////////////////////
-- 	int pX=60,pY=5;
    let pX = 60
    let pY = 5
-- 	int chosse=0;
-- 	char comd=0;
    let comd = 0
-- 	gotoxy(pX-1,pY);
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
-- 	max =30;ppl=6;li=5;rd=6;
    let max = 30
    let ppl = 6
    let li = 5
    let rd = 6
-- 	while(comd != 13)
-- 	{

-- 		colorit(15);
        setSGR [SetColor Foreground Vivid White] 
	    setSGR [SetColor Background Dull Black]
-- 		gotoxy(pX+3,10+pY);	
        setCursorPosition (pY+10) (pX+3)
-- 		cout<<" Small ";
        print " Small "
		
-- 		gotoxy(pX+1,14+pY);
        setCursorPosition (pY+1) (pX+14)
-- 		cout<<" Standard ";
        print " Standard "
		
-- 		gotoxy(pX+3,18+pY);
        setCursorPosition (pY+3) (pX+18)
-- 		cout<<" Large ";
        print " Large "
		
-- 		gotoxy(pX,22+pY);
        setCursorPosition (pY+22) (pX)
-- 		cout<<" Costom Map ";
		print " Costom Map "

-- 		switch(chosse)
-- 		{
-- 			case 0:
-- 			gotoxy(pX+3,10+pY);
-- 			psq(224,0.5);
-- 			colorit(12);
-- 			cout<<"Small";
-- 			psq(224,0.5);
-- 			max =30;ppl=6;li=5;rd=6;
-- 			break;
        if chosse == 0
                then 
                    do
                        setCursorPosition (pY+10) (pX+3)
                        psq Vivid Yellow 1
                        setSGR [SetColor Foreground Vivid Red] 
	                    setSGR [SetColor Background Dull Black]
                        print "Small"
                        psq Vivid Yellow 1
                        let max =30
                        let ppl=6
                        let li=5
                        let rd=6
-- 			case 1:
-- 			gotoxy(pX+1,14+pY);
-- 			psq(224,0.5);
-- 			colorit(12);
-- 			cout<<"Standard";
-- 			max =50;ppl=8;li=8;rd=8;
-- 			psq(224,0.5);
-- 			break;
            else if chosse == 1
                then 
                    do
                        setCursorPosition (pY+14) (pX+1)
                        psq Vivid Yellow 1
                        setSGR [SetColor Foreground Vivid Red] 
	                    setSGR [SetColor Background Dull Black]
                        print "Standard"
                        psq Vivid Yellow 1
                        let max =50
                        let ppl=8
                        let li=8
                        let rd=8
-- 			case 2: 
-- 			gotoxy(pX+3,18+pY);
-- 			colorit(12);	
-- 			psq(224,0.5);
-- 			colorit(12);
-- 			cout<<"Large";
-- 			max =100;ppl=10;li=10;rd=10;
-- 			psq(224,0.5);
-- 			break;
-- 			case 3:
            else if chosse == 2
                then 
                    do
                        setCursorPosition (pY+18) (pX+3)
                        psq Vivid Yellow 1
                        setSGR [SetColor Foreground Vivid Red] 
	                    setSGR [SetColor Background Dull Black]
                        print "Large"
                        psq Vivid Yellow 1
                        let max =100
                        let ppl=10
                        let li=10
                        let rd=10
-- 			gotoxy(pX,22+pY);
-- 			colorit(12);	
-- 			psq(224,0.5);
-- 			colorit(12);
-- 			cout<<"Costom Map";
-- 			psq(224,0.5);
-- 			break;
            else if chosse == 3
                then 
                    do
                        setCursorPosition (pY+22) (pX)
                        psq Vivid Yellow 1
                        setSGR [SetColor Foreground Vivid Red] 
	                    setSGR [SetColor Background Dull Black]
                        print "Costom Map"
                        psq Vivid Yellow 1
            else do return ()
-- 			default:
-- 			break;
-- 		}
-- 		colorit(15);
        setSGR [SetColor Foreground Vivid White] 
	    setSGR [SetColor Background Dull Black]
-- 		comd = getch();
        a <- getChar
-- 		PlaySound(TEXT("sound/menu.wav"),NULL,SND_SYNC);
-- 		if(comd =='w')chosse--;
-- 		else if(comd == 's')chosse++;
-- 		chosse = (4+(chosse))%4;
        if a == 'w'
            then 
                cremap ((4+(chosse-1)) `mod` 4)
            else if a == 'w'
                then
                    cremap ((4+(chosse+1)) `mod` 4)
            else if a == 's'
                then 
                    cremap ((4+(chosse+1)) `mod` 4)
            else if a == 'c'
                then
                    return c
            else
                cremap c
-- 	}
	
-- 	if(chosse == 3)
-- 	{
    if chosse == 3
        then
            do
                clearScreen

-- 		system("cls");
-- 		do{	
-- 			int pX =40,pY=5;
                let pX = 40
                let pY = 5
-- 			gotoxy(pX+5,pY);
                setCursorPosition (pY) (pX+5)
-- 			cout<<"Input you map data(number only)";
                print "Input you map data(number only)"
-- 			pY=8;
                let pY = 8
-- 			gotoxy(pX,pY);
                setCursorPosition (pY) (pX)
-- 			for(int i=0;i<12;i++)
-- 			{
                forM_ [1..11] $ \i -> do
-- 				gotoxy(pX,pY+i);
                    setCursorPosition (pY+i) (pX)
-- 				psq(0,25);
                    psq Vivid Black 25
-- 			}
-- 				if(max-2 < li*4 || max-2-(li*4) < rd || ppl > 12 || max<19)
-- 			{
                if (max-2 < li*4) or (max-2-(li*4) < rd) or (ppl > 12) or (max<19)
                    then
                        do
-- 				gotoxy(pX+10,pY-2);
                            setCursorPosition (pY-2) (pX+10)
-- 				colorit(12);
                            setSGR [SetColor Foreground Vivid Red] 
	                        setSGR [SetColor Background Dull Black]
				
-- 				cout<<"*You input wrong data.*";
                            print "*You input wrong data.*"
-- 				PlaySound(TEXT("sound/randpad.wav"),NULL,SND_SYNC);
-- 				colorit(15);
                            setSGR [SetColor Foreground Vivid White] 
	                        setSGR [SetColor Background Dull Black]
-- 			}
                    else do Nothing
-- 			gotoxy(pX,pY);
                setCursorPosition (pY) (pX)
-- 			cout<<"How many pads do you want?";
                print "How many pads do you want?"
-- 			gotoxy(pX,++pY);
                setCursorPosition (pY+1) (pX)
-- 			colorit(12);
                setSGR [SetColor Foreground Vivid Red] 
	            setSGR [SetColor Background Dull Black]
-- 			cout<<"> ";
                print "> "
-- 			colorit(15);
                setSGR [SetColor Foreground Vivid White] 
	            setSGR [SetColor Background Dull Black]
-- 			cin>>max;
                max <- getLine
-- 			PlaySound(TEXT("sound/confirm.wav"),NULL,SND_SYNC);
-- 			pY+=2;
-- 			gotoxy(pX,pY);
                setCursorPosition (pY+2) (pX)
-- 			cout<<"How many pads do you want per one floor?";
                print "How many pads do you want per one floor?"
-- 			gotoxy(pX,++pY);
                setCursorPosition (pY+3) (pX)
-- 			colorit(12);
                setSGR [SetColor Foreground Vivid Red] 
	            setSGR [SetColor Background Dull Black]
-- 			cout<<"> ";
                print "> "
-- 			colorit(15);
                setSGR [SetColor Foreground Vivid White] 
	            setSGR [SetColor Background Dull Black]
-- 			cin>>ppl;
                ppl <- getLine
-- 			PlaySound(TEXT("sound/confirm.wav"),NULL,SND_SYNC);
-- 			pY+=2;
-- 			gotoxy(pX,pY);
                setCursorPosition (pY+4) (pX)
-- 			cout<<"How many snake and ladder pads doyou want?";
                print "How many snake and ladder pads doyou want?"
-- 			gotoxy(pX,++pY);
                setCursorPosition (pY+5) (pX)
-- 			cout<<"(number of snake pads = number of  ladder pads)";
                print "(number of snake pads = number of  ladder pads)"
-- 			gotoxy(pX,++pY);
                setCursorPosition (pY+5) (pX)
-- 			colorit(12);
                setSGR [SetColor Foreground Vivid Red] 
	            setSGR [SetColor Background Dull Black]
-- 			cout<<"> ";
                print "> "
-- 			colorit(15);
                setSGR [SetColor Foreground Vivid White] 
	            setSGR [SetColor Background Dull Black]
-- 			cin>>li;
                li <- getLine
-- 			PlaySound(TEXT("sound/confirm.wav"),NULL,SND_SYNC);
-- 			pY+=2;
-- 			gotoxy(pX,pY);
                setCursorPosition (pY+6) (pX)
-- 			cout<<"How many random pads doyou want? : ";
                print "How many random pads doyou want? : "
-- 			gotoxy(pX,++pY);
                setCursorPosition (pY+7) (pX)
-- 			colorit(12);
                setSGR [SetColor Foreground Vivid Red] 
	            setSGR [SetColor Background Dull Black]
-- 			cout<<"> ";
                print "> "
-- 			colorit(15);
                setSGR [SetColor Foreground Vivid White] 
	            setSGR [SetColor Background Dull Black]
-- 			cin>>rd;
                rd <- getLine
-- 			PlaySound(TEXT("sound/confirm.wav"),NULL,SND_SYNC);
-- 		}while(max-2 < li*4 || max-2-(li*4) < rd || ppl > 12 || max<19);
-- 		cin.ignore();
-- 		PlaySound(TEXT("sound/menu.wav"),NULL,SND_SYNC);
-- 	}

-- 	system("cls");
-- 	SetWindow(250,(max/ppl)*7+30);

    restoreCursor
-- 	return map(max,ppl,li,rd);
-- }