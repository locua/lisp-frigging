;; '(rose violet daisy buttercup cherry)

;; '(this list has (a list inside of it))

(+ 2 2) ;; 4

(+ 2 (+ 2 2)) ;; 6

;; (this is an unquoted list)

(print "hello world")   

(insert "hello world")  
hello world

(insert ";;" (+ 2 2))

(defun hello(name) (insert ";; Hi, " name)) 

(hello "Jon")
;; Hi, Jon

(switch-to-buffer-other-window "*test*")

;; it's often useful to erase the buffer
(progn
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello "you"))

;; or go back to the other window
(progn
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello "okay dokay")
  (other-window 1))

;; you can bind a value to a local variable with 'let':
(let ((local-name "you"))
  (switch-to-buffer-other-window "*test*")
  (erase-buffer)
  (hello local-name)
  (other-window 1))

;; Format a string like so
(hello (format "Mx %s!\n" "Caesar"))
;; Hi, Mx Caesar!

(defun hello (name)
  (insert (format ";; Hello %s!\n" name)))

(hello "Jerimiah")
;; Hello Jerimiah!

;; another function using let

(defun greeting (name)
  (let ((your-name "BOB"))
    (insert (format ";; Hello %s!\n;; I am %s."
		    name;
		    your-name;
		    ))))

(greeting "Amanda")
;; Hello Amanda!
;; I am BOB.



