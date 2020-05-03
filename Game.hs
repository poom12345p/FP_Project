module Game where
import System.Console.ANSI
import System.IO.Unsafe
import System.Random
import Func
import DrawDice
data Pad = Pad { color :: Color
                     , x :: Int
                     , y :: Int
                     , linktopad :: Int
                     , num :: Int
                     , ty :: Char
                     , player :: [Player]
                     } deriving Show

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
myPad = Pad Yellow 20 20 3 4 'L' []

rand::Int->Int->Int
rand a b =  unsafePerformIO (getStdRandom (randomR (a, b)))

drawPad :: Pad -> Int -> IO()
drawPad pad last = do
	let pcl =
		if (num pad) == 1 || last /= 0
			then
				Yellow
			else 
				(color pad)
	setCursorPosition (y pad) (x pad)
	psq Vivid pcl 9
	setCursorPosition ((y pad)-1) ((x pad)+1)
	psq Vivid pcl 3.5
	-- colorit(pcl) ----------------
	setSGR [SetColor Foreground Vivid Red]
	setSGR [SetColor Background Vivid pcl] 
	if (ty pad) == 'T'
		then do
			-- colorit(207) ----------------
			setSGR [SetColor Foreground Vivid White] 
			setSGR [SetColor Background Vivid Red] 
		else
			return()
	if (num pad) < 10
		then
			putStr "0"
		else
			return()
	putStr $ show (num pad)
	-- colorit(15) ---------------
	setSGR [SetColor Foreground Vivid White] 
	setSGR [SetColor Background Dull Black] 
	if (num pad) >= 100
		then
			psq Vivid pcl 3
		else
			psq Vivid pcl 3.5
	if (num pad) == 1
		then do
			setCursorPosition (y pad) ((x pad) + 6)
			-- colorit(pcl) -----------------
			setSGR [SetColor Foreground Vivid Red]
			setSGR [SetColor Background Vivid pcl] 
			putStr "START"
			-- colorit(15) -------------------
			setSGR [SetColor Foreground Vivid White] 
			setSGR [SetColor Background Dull Black]  
		else
			return()
	if (ty pad) == 'L'
		then do
			setCursorPosition (y pad) ((x pad) + 7)
			if (linktopad pad) < (num pad)
				then do
					-- colorit(207) -------------
					setSGR [SetColor Foreground Vivid White] 
					setSGR [SetColor Background Vivid Red] 
				else do
					-- colorit(97) --------------
					setSGR [SetColor Foreground Dull Blue] 
					setSGR [SetColor Background Dull Yellow] 
			if (linktopad pad) < (num pad)
				then do
					if (linktopad pad) < 10
						then
							putStr "0"
						else
							return()
					putStr $ show (linktopad pad) ++ "<-"
				else do
					putStr "->"
					if (linktopad pad) < 10
						then
							putStr "0"
						else
							return()
					putStr $ show (linktopad pad)
			-- colorit(15) -------------------
			setSGR [SetColor Foreground Vivid White] 
			setSGR [SetColor Background Dull Black] 
		else
			return()
	if (ty pad) == 'R'
		then do
			setCursorPosition (y pad) ((x pad) + 6)
			-- colorit(112) ---------------------
			setSGR [SetColor Foreground Dull White] 
			setSGR [SetColor Background Dull Black] 
			putStr "RANDOM"
			-- colorit(15) --------------------
			setSGR [SetColor Foreground Vivid White] 
			setSGR [SetColor Background Dull Black] 
		else
			return()
	if (num pad) == last
		then do
			drawstar (x pad) (y pad)
			setCursorPosition (y pad) ((x pad) + 6)
			-- colorit(pcl) -------------------
			setSGR [SetColor Foreground Vivid Red]
			setSGR [SetColor Background Vivid pcl]  
			putStr "FINISH"
			-- colorit(15) ----------------
			setSGR [SetColor Foreground Vivid White] 
			setSGR [SetColor Background Dull Black] 
		else
			return()

rolldice::Int->Int->IO Int
rolldice x y =do
                let dice = rand 1 6
                drawDice dice x y  
                return dice


