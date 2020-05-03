module Map where
import System.Console.ANSI
import System.Random
import Data.List.Index
import System.IO.Unsafe
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
rand::Int->Int->Int
rand a b =  unsafePerformIO (getStdRandom (randomR (a, b)))


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
setpad i ppl mp sl ll= Pad (setpadColor i) ((250-(18*ppl)) `div` 2) ( (7*((mp-(mp `mod` ppl)) `div` ppl+1))-(7*((i-(i `mod` ppl)) `div` ppl))) ( chcekGo i sl ll) (i) (chcechLink i sl ll) []
    where
        setpadColor:: Int -> Color
        setpadColor i
                | (i `mod` 2) == 0 =Blue
                | otherwise =Green

        chcechLink::Int->[Linkpad]->[Linkpad]->Char
        chcechLink i ((Link sh st):sl) ((Link lh lt):ll)
                                        | i == sh = 'L'
                                        | i == lh = 'L'
                                        | length(sl) /= 0 = chcechLink i sl ll
                                        | otherwise ='N'

        chcekGo::Int->[Linkpad]->[Linkpad]->Int
        chcekGo i ((Link sh st):sl) ((Link lh lt):ll)
                                        | i == sh = st
                                        | i == lh = lt
                                        | length(sl) /= 0 = chcekGo i sl ll
                                        | otherwise = 0

padgetPlay:: Map->Map
padgetPlay
-- data Pad= Pad { color :: Color
--                      , x :: Int
--                      , y :: Int
--                      , linktopad :: Int
--                      , num :: Int
--                      , ty :: Char
--                      , player :: Char
--                      } deriving Show