module Main where


--------------------------------------------------------------
data BStree a = BNil | Node { value :: a, bstl :: BStree a, bstr :: BStree a }  deriving (Show)
--Interp. Binary search tree

empty_tree :: BStree a
empty_tree = BNil



instance (Eq a) => Eq (BStree a) where
	(Node val bl br)    == (Node val1 bl1 br1) = (val  == val1)
 


--------------------------------------------------------------
genBStree :: [a] -> BStree a
genBStree [] = BNil
genBStree (x:xs) = if (length xs < 1)
                       then Node x (genBStree []) (genBStree [])
                   else if (length xs < 2)
                           then Node x (genBStree [xs!!0]) (genBStree [])
                        else if (length xs < 3)
                                then Node x (genBStree [xs!!0]) (genBStree [xs!!1])
                             else if (length xs < 4)
                                     then Node x (genBStree [xs!!0, xs!!1]) (genBStree [xs!!2])
                                  else Node x (genBStree (take (div (length xs) 2) xs)) (genBStree (drop (div (length xs) 2) xs))
                 

---------------------------------------------------------------
high_of_bstree :: BStree a -> Int
high_of_bstree BNil = 0
high_of_bstree bst = 1 + max (high_of_bstree (bstl bst)) (high_of_bstree (bstr bst))


tmap :: (BStree a) -> (a -> b) -> (BStree b)
tmap BNil operation = BNil
tmap (Node v br bl) operation = (Node (operation v) (tmap br operation) (tmap bl operation)) 




main = print (tmap (genBStree ["0","1","2","3","4","5","6","7"]) ("new" ++))
