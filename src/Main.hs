module Main where


--------------------------------------------------------------
data BStree a = BNil | Node { value :: a 
                          , bstl :: BStree a
                          , bstr :: BStree a
                          }  deriving (Show)
--Interp. Binary search tree

empty_tree :: BStree a
empty_tree = BNil


--treeEqNil :: BStree a -> BStree a -> Bool
--treeEq empty_tree empty_tree = True 
--treeEq (/empty_tree) empty_tree = False
--instance Eq (BStree a) where
	--(Node val l r) == BNil = (val == BNil)
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
--high_of_bstree :: Eq (BStree a) => (BStree a) -> Int
--high_of_bstree bst = let 
  --                    go bst' count = if bst' /= empty_tree 
    --                                    then go (bstl bst') count+1
      --                                else count
        --             in go bst (if bst /= empty_tree then 1 else 0)

tmap :: (BStree a) -> (a -> b) -> (BStree b)


--x (genBStree (filter (<x) xs))
--(genBStree (filter (>x) xs))



main = print (genBStree ["0","1","2","3","4","5","6","7"])
