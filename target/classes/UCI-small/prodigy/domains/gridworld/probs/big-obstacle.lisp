;******* VERSION 1-1 ******* Locked by nobody *******
; 
; This problem has the RMG move from 1,1 to 1,4 with an obstacle 
;  at 1,3.

(load-goal '(at RMG (location 0 3 0 0 3 0)))


(load-start-state
 '((at RMG (location 0 0 0 0 0 0))
   (at block1 (location 0 2 0 0 2 0))
   (object block1 (size 1 1 1))
   (at block2 (location 0 2 1 0 2 1))
   (object block2 (size 1 1 1))))
