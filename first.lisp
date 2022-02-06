(setq *print-case* :capitalize)

(defvar *age* 293029)


;; (if (not (= *age* 18))
;;     (Format t "You can vote~%")
;;     (format t "You can't vote~%"))

;;(if (and (>= *age* 13) (<= *age* 43))
;;    (format t "yes~%")
;;    (format t "no~%"))


(if (or (<= *age* 13) (>= *age* 43))
    (format t "work if u wanna~%")
    (format t "work ~%"))

(defun hello()
    (print "hello")
    (terpri))

(hello)


(defun get-avg (num-1 num-2)
    (print (/ (+ num-1 num-2) 2))
    (terpri)) 

;;;(format t "Avg 10 & 50 = ~a ~%" (get-avg 10 50))

(get-avg 4.0 5)

(defvar *total* 0)

(defun sum(&rest nums)
    (dolist (num nums)
        (setf *total* (+ *total* num)))
    (format t  "sum = ~a ~%" *total*))

;; sum 1 2 3 43 5 6 78 8)

(defun print-list(&optional &key x y z)
    (format t "List: ~a ~%" (list x y z)))

(print-list :x 3 :y 9)

(defun difference (num1 num2)
    (return-from difference(- num1 num2)))


(format t "difference: ~a ~%" (difference 10 20))

;;; Quasi quoting mode switches between data and executing code
(defun get-hero-data (size)
    (format t "~a ~%" `(,(caar size) is ,(cadar size) and, (cddar size))))

(defparameter *hero-size*
    '((Superman (6ft 3 in) (70kg))
      (Flash (5ft 2 in) (50kg))
      (Batman (7tf 3 in) (120kg))))

(get-hero-data *hero-size*)


(format t "A number ~a ~%" (mapcar #'numberp '(1 2 3 f g)))

(flet ((double-it (num)
    (* 2 num))
    (triple-it (num)
    (* 3 num)))
    (format t "Double it and triple it 10 = ~d~%" (triple-it(double-it 10))))

;;;(labels ((double-it (num)
;;;            (* num 2))
;;;        (triple-it (num)
;;;            (* doublekk

(defconstant +year-size+ 365)

(defun birthday-paradox (probability number-of-people)
  (let ((new-probability (* (/ (- +year-size+ number-of-people)
                               +year-size+)
                            probability)))
    (if (< new-probability 0.5)
        (1+ number-of-people)
        (birthday-paradox new-probability (1+ number-of-people)))))

(print (birthday-paradox 1.0 1))

(defun power (x n)
  (loop with result = 1
        while (plusp n)
        when (oddp n) do (setf result (* result x))
        do (setf x (* x x)
                 n (truncate n 2))
        finally (return result)))

(print (power 2 300))
(print (= (expt 2 200) (power 2 200)))
