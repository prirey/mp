#|
*******************************************************************************
PRODIGY Version 2.01  
Copyright 1989 by Steven Minton, Craig Knoblock, Dan Kuokka and Jaime Carbonell

The PRODIGY System was designed and built by Steven Minton, Craig Knoblock,
Dan Kuokka and Jaime Carbonell.  Additional contributors include Henrik Nordin,
Yolanda Gil, Manuela Veloso, Robert Joseph, Santiago Rementeria, Alicia Perez, 
Ellen Riloff, Michael Miller, and Dan Kahn.

The PRODIGY system is experimental software for research purposes only.
This software is made available under the following conditions:
1) PRODIGY will only be used for internal, noncommercial research purposes.
2) The code will not be distributed to other sites without the explicit 
   permission of the designers.  PRODIGY is available by request.
3) Any bugs, bug fixes, or extensions will be forwarded to the designers. 

Send comments or requests to: prodigy@cs.cmu.edu or The PRODIGY PROJECT,
School of Computer Science, Carnegie Mellon University, Pittsburgh, PA 15213.
*******************************************************************************|#


; sel12.lisp

(setq *SCR-OP-SELECT-RULES* 
     '((SELECT-UP
          (lhs (and (current-node <node>)
                    (current-goal <node> (place <x> <y> <p>))
                    (candidate-op <node> UP)
                    (known <node> (and (hnei <y> <z>)
                                       (place <x> <z> <p>)))))
          (rhs (select operator UP)))

       (SELECT-DOWN
          (lhs (and (current-node <node>)
                    (current-goal <node> (place <x> <y> <p>))
                    (candidate-op <node> DOWN)
                    (known <node> (and (hnei <z> <y>)
                                       (place <x> <z> <p>)))))
          (rhs (select operator DOWN)))

       (SELECT-RIGHT
          (lhs (and (current-node <node>)
                    (current-goal <node> (place <x> <y> <p>))
                    (candidate-op <node> RIGHT)
                    (known <node> (and (vnei <z> <x>)
                                       (place <z> <y> <p>)))))
          (rhs (select operator RIGHT)))

       (SELECT-LEFT
          (lhs (and (current-node <node>)
                    (current-goal <node> (place <x> <y> <p>))
                    (candidate-op <node> LEFT)
                    (known <node> (and (hnei <y> <z>)
                                       (place <x> <z> <p>)))))
          (rhs (select operator LEFT)))

;-----------to improve 2x2 problem  ---------------------------------------

     (SELECT-UP2
        (lhs (and (current-node <node>)
                  (current-goal <node> (place <x> <y> <p>))
                  (candidate-op <node> UP)
                  (known <node> (and (hnei <x> <z>)
                                     (vnei <y> <w>)
                                     (pla <x> <w>)
                                     (place <z> <w> <p>)))))
        (rhs (select operator UP)))

     (SELECT-LEFT2
        (lhs (and (current-node <node>)
                  (current-goal <node> (place <x> <y> <p>))
                  (candidate-op <node> LEFT)
                  (known <node> (and (hnei <x> <z>)
                                     (vnei <y> <w>)
                                     (pla <z> <y>)
                                     (place <z> <w> <p>)))))
        (rhs (select operator LEFT)))

)))
