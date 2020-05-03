
module DrawDice where
import Control.Monad
import System.IO
import System.Console.ANSI
import Func 
drawDice d x y  
    | d == 0 = dicecase0 x y
    | d == 1 = dicecase1 x y
    | d == 2 = dicecase2 x y
    | d == 3 = dicecase3 x y
    | d == 4 = dicecase4 x y
    | d == 5 = dicecase5 x y
    | d == 6 = dicecase6 x y


dicecase0 x y = loop x y 0 5 0 10
    where loop x y n m k f = if n < m
                    then do if k<f
                            then do
                                setCursorPosition (x+n) (x+k)
                                psq Vivid Black 1
                                loop x y n m (k+1) f
                            else loop x y (n+1) m 0 f
                    else return()
dicecase1 x y = loop x y 0 5 0 10
    where loop x y n m k f = if n < m
                    then do if k<f
                            then do
                                setCursorPosition (x+n) (x+k)
                                if (k == 4 || k == 5 )&& (n==2)
                                    then do 
                                        psq Vivid Red 1
                                else psq Vivid White 1
                                loop x y n m (k+1) f
                            else loop x y (n+1) m 0 f
                    else return()

dicecase2 x y = loop x y 0 5 0 10
    where loop x y n m k f = if n < m
                    then do if k<f
                            then do
                                setCursorPosition (x+n) (x+k)
                                if (k  `mod` 4 == 2|| k  `mod` 4 == 3)&& (n==2)
                                    then do 
                                        psq Vivid Red 2
                                else psq Vivid White 1
                                loop x y n m (k+1) f
                            else loop x y (n+1) m 0 f
                    else return()

dicecase3 x y = loop x y 0 5 0 10
    where loop x y n m k f = if n < m
                    then do if k<f
                            then do
                                setCursorPosition (x+n) (x+k)
                                if (n>0 && n<4 && (k-1 == n*2 || k == n*2))
                                    then do 
                                        psq Vivid Red 1
                                else psq Vivid White 1
                                loop x y n m (k+1) f
                            else loop x y (n+1) m 0 f
                    else return()

dicecase4 x y = loop x y 0 5 0 10
    where loop x y n m k f = if n < m
                    then do if k<f
                            then do
                                setCursorPosition (x+n) (x+k)
                                if ((n==1||n==3)&&(k `mod` 4==2||k `mod` 4==3))
                                    then do 
                                        psq Vivid Red 1
                                else psq Vivid White 1
                                loop x y n m (k+1) f
                            else loop x y (n+1) m 0 f
                    else return()
dicecase5 x y = loop x y 0 5 0 10
    where loop x y n m k f = if n < m
                    then do if k<f
                            then do
                                setCursorPosition (x+n) (x+k)
                                if ((n `mod` 2==1)&&(k `mod` 6==1||k `mod` 6==2))
                                    then do 
                                        psq Vivid Red 1
                                else if ((n == 2)&&(k `mod` 6==4||k `mod` 6==5))
                                   then do 
                                        psq Vivid Red 1       
                                else psq Vivid White 1
                                loop x y n m (k+1) f
                            else loop x y (n+1) m 0 f
                    else return()

dicecase6 x y = loop x y 0 5 0 10
    where loop x y n m k f = if n < m
                    then do if k<f
                            then do
                                setCursorPosition (x+n) (x+k)
                                if ((n==1||n==3)&&(k==1||k==2||k==4||k==5||k==7||k==8))
                                    then do 
                                        psq Vivid Red 1
                                else psq Vivid White 1
                                loop x y n m (k+1) f
                            else loop x y (n+1) m 0 f
                    else return()
