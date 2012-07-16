#|
*******************************************************************************
PRODIGY Version 2.01  
Copyright 1989 by Mike Miller

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




(setq *generated-formulae* (make-hash-table :test #'equal))


(defun genformula (type &rest vars)
  (unless (or (is-variable type) (null vars)
	      (notevery #'(lambda (z) (is-variable z)) vars))
    (list (mapcar #'(lambda (y) (list y (geninst type))) vars))))


(defun  geninst (type)
  (if (symbolp type)
      (let* ((g (symbol-name type))
	     (n (gethash g *generated-formulae*)))
	(setq n (if n 
		    (setf (gethash g *generated-formulae*) (1+ n))
		    (setf (gethash g *generated-formulae*) 1)))
	(intern  (concatenate 'string g "-" (format nil "~D" n))))))



(defun before (x y)
  (cond ((and (numberp x) (numberp y)) (< x y))
	(t 'no-match-attempted)))


(defun increment-time (x y)
  (cond ((and (numberp x) (is-variable y)) `(((,y  ,(1+ x)))))
	(t 'no-match-attempted)))


(defun not-equal-p (x y)
  "determine whether two things are not equal.  If one of the args is 
   a variable we cannot match."
  (cond ((or (is-variable x) (is-variable y)) 'no-match-attempted)
	(t (not (equal x y)))))

(defun equal-p (x y)
  "determine whether two things are equal. If one of the args is 
   a variable it will get bound to the other argument."
  (cond ((and (is-variable x) (is-variable y)) 'no-match-attempted)
	((is-variable x) `(((x y))))
	((is-variable y) `(((y x))))
	(t (equal x y))))



