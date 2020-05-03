module Map where
import System.Console.ANSI
import System.Random
import Data.List.Index
import System.IO
import Game
import Func

data Linkpad = Link {
    head :: Int,
    tail :: Int
}deriving (Show)


data Map= M {   link :: Int,
                ppl ::Int,
                maxpad :: Int,
                frame ::Int,
                pads ::[Pad],
                myplayers :: [Player]
               } deriving (Show)



main = do
        let c  = rand 0 10
        print(c) 



        
newmap:: Int-> Int-> Int-> Map
newmap mp pl l  =  let pool =[1..mp] in
                    let (sl,pool2) = randLinkS l pool in
                        let (ll,pool3) =randLinkL l pool2 in       
                            M (l) (pl) (mp) 0 (createPads mp pl l sl ll) []
-- newmap:: Int-> Int-> Int-> Map
-- newmap mp pl l  = do
--                     let numpad=[1..mp]
--                     let snakeL=[]
--                     let ladder=[]
--                     M (l) (pl) (mp) 0 (createPads mp pl l) []

randSnakeLink::[Int]->([Int],Linkpad)
randSnakeLink pool  = let loc = rand 1 (length(pool)-2) in
            let h = pool!!loc in
              let pool2 =  deleteAt loc pool in
                let locB = rand 0 (loc-1) in
                    let t = pool2!!locB in
             let pool3 =deleteAt locB pool2 in
                 (pool3,Link h t)

randLadLink::[Int]->([Int],Linkpad)
randLadLink pool  = let loc = rand 0 (length(pool)-3) in
            let h = pool!!loc in
              let pool2 =  deleteAt loc pool in
                let locB = rand loc (length(pool)-2) in
                    let t = pool2!!locB in
             let pool3 =deleteAt locB pool2 in
                 (pool3,Link h t)


randLinkS::Int->[Int]->([Linkpad],[Int])
randLinkS i pool 
                    | i > 0 = let (p,l) = randSnakeLink pool in
                                          let (lp,np) =randLinkS (i-1) p in
                                              ([l]++lp,np)
                    | otherwise = ([],pool)
                    

randLinkL::Int->[Int]->([Linkpad],[Int])
randLinkL i pool  
                 | i > 0 = let (p,l) = randLadLink pool in
                                          let (lp,np) =randLinkL (i-1) p in
                                              ([l]++lp,np)
                 | otherwise = ([],pool)
--                     let locA = rand 1 (length(pool)-1)
--                     h <- pool!!locA
--                     deleteAt locA pool
--                     let loc = rand 0 (locA-1)
--                     t <- pool!!loc
--                     deleteAt (loc) (pool)
--                     return (h,t)


            
                    
createPads:: Int->Int->Int->[Linkpad]->[Linkpad]->[Pad]
createPads mp pl l  sl ll= [setpad i pl mp sl ll|i<-[1..mp]]
                        

setpad:: Int->Int->Int->[Linkpad]->[Linkpad]->Pad
setpad i ppl mp sl ll= Pad (setpadColor i) ((250-(18*ppl)) `div` 2) ( (7*((mp-(mp `mod` ppl)) `div` ppl+1))-(7*((i-(i `mod` ppl)) `div` ppl))) (0) (i) ('N') []

setpadColor:: Int -> Color
setpadColor i
                | (i `mod` 2) == 0 =Blue
                | otherwise =Green

chcechLink::Int->[Linkpad]->[Linkpad]->Char
chcechLink i (sl) (ll)
                                        | length(sl) > 0 = chcechLink' i sl ll
                                        | otherwise ='N'
     where
        chcechLink'::Int->[Linkpad]->[Linkpad]->Char
        chcechLink' i ((Link sh st):sl) ((Link lh lt):ll)
                                                | i == sh = 'L'
                                                | i == lh = 'L'
                                                | length(sl) > 0 = chcechLink' i sl ll
                                                | otherwise ='N'
chcekGo::Int->[Linkpad]->[Linkpad]->Int
chcekGo i (sl) (ll)
                                        | length(sl) > 0 = chcekGo' i sl ll
                                        | otherwise = 0
                                        where
                                            chcekGo'::Int->[Linkpad]->[Linkpad]->Int
                                            chcekGo' i ((Link sh st):sl) ((Link lh lt):ll)
                                                                                    | i == sh = st
                                                                                    | i == lh = lt
                                                                                    | length(sl) > 0 = chcekGo' i sl ll
                                                                                    | otherwise = 0

-- padgetPlay:: Map->Map
-- padgetPlay
-- data Pad= Pad { color :: Color
--                      , x :: Int
--                      , y :: Int
--                      , linktopad :: Int
--                      , num :: Int
--                      , ty :: Char
--                      , player :: Char
--                      } deriving Show
fordms1:: Map -> Int -> Int -> Int -> Int -> IO()
fordms1 map j max xx i
    | j < max   = do
        setCursorPosition ((y $ (pads map)!!i) - 1 - j) ((x $ (pads map)!!i) + xx)
        psq Dull White 0.5
        fordms1 map (j+1) max xx i
    | otherwise = return()
---- sub2
fordms2:: Map -> Int -> Int -> Int -> Int -> IO()
fordms2 map j max xx i
    | j < max   = do
        setCursorPosition ((y $ (pads map)!!i) - j) ((x $ (pads map)!!i) + xx + 1)
        psq Dull White 0.5
        fordms2 map (j+2) max xx i
    | otherwise = return()
---- sub3
fordms3:: Map -> Int -> Int -> Int -> Int -> IO()
fordms3 map j max xx i
    | j < max   = do
        setCursorPosition ((y $ (pads map)!!i) - 1 - j) ((x $ (pads map)!!i) + xx + 2)
        psq Dull White 0.5
        fordms3 map (j+1) max xx i
    | otherwise = return()

fordm1:: Map -> Int -> Int -> IO()
fordm1 map i max
    | (i < max)   = do
        -- let c = 127
        let level = (i - (i `mod` (ppl map))) `div` (ppl map)
        drawPad ((pads map)!!i) 0
        if mod (i + 1) (ppl map) == 0
            then do
                let xx = if (mod level  2) == 0
                    then 17
                    else -2
                if xx == -2
                    then do
                        setCursorPosition (y $ (pads map)!!i) ((x $ (pads map)!!i) + xx)
                        psq Dull White 0.5
                    else do
                        setCursorPosition (y $ (pads map)!!i) ((x $ (pads map)!!i) + xx + 2)
                        psq Dull White 0.5
                fordms1 map 0 7 xx i
                fordms2 map 0 8 xx i
                setCursorPosition ((y $ (pads map)!!i) - 7) ((x $ (pads map)!!i) + xx + 1)
                psq Dull White 0.5
                fordms3 map 0 7 xx i
            else
                return()
        if i + 2 == (maxpad map)
            then
                drawPad ((pads map)!!(i + 1)) (maxpad map)
            else
                return ()
        fordm1 map (i+1) max
    | otherwise = return()

-- fordm2:: Map -> Int -> Int -> IO()
-- fordm2 map i max
--     | i < max   = do
--         -- drawme -----------------
--         -- drawstat -----------------
--         fordm2 map i+1 max
--     | otherwise = return()

fordm3:: Map -> Int -> Int -> IO()
fordm3 map i min
    | i > min   = do
        setCursorPosition i ((x $ (pads map)!!0) - 4)
        if mod i 2 == 0
            then
                psq Dull White 1
            else
                psq Vivid Black 1
        fordm3 map (i-1) min
    | otherwise = return()

fordm4:: Map -> Int -> Int -> IO()
fordm4 map i min
    | i > min   = do
        setCursorPosition i ((x $ (pads map)!!((ppl map) - 1)) + 20)
        if mod i 2 == 0
            then
                psq Dull White 1
            else
                psq Vivid Black 1
        fordm4 map (i-1) min
    | otherwise = return()

fordm5:: Map -> Int -> Int -> IO()
fordm5 map i max
    | i < max   = do
        setCursorPosition ((y $ (pads map)!!0) + 4 + i) 140
        psq Vivid Yellow 1
        setCursorPosition ((y $ (pads map)!!0) + 4 + i) (140 + 72)
        psq Vivid Yellow 1
        fordm5 map (i+1) max
    | otherwise = return()
--------------- main --------------------
drawmap:: Map -> IO()
drawmap map = do
    fordm1 map 0 (length (pads map) - 1)
    -- fordm2 map 0 (length (myplayers map))
    setCursorPosition ((y $ (pads map)!!0) + 1) 0
    psq Vivid Green 125
    setCursorPosition ((y $ (pads map)!!0) + 2) 0
    psq Dull Red 125
    ---- wall
    fordm3 map (y $ (pads map)!!0) (y $ (pads map)!!((maxpad map) - 1))
    fordm4 map (y $ (pads map)!!0) (y $ (pads map)!!((maxpad map) - 1))
    ---- square
    setCursorPosition ((y $ (pads map)!!0) + 4) 140
    psq Vivid Yellow 36
    fordm5 map 0 17
    setCursorPosition ((y $ (pads map)!!0) + 20) 140
    psq Vivid Yellow 36

newPlayer:: Int->Map->Map
newPlayer i (M link ppl maxpad frame pads myplayers)
     | i == 1 = M link ppl maxpad frame pads (myplayers ++ [player1])
     | otherwise = M link ppl maxpad frame pads (myplayers++[])