;; This gives an introduction to Emacs Lisp in 15 minutes (v0.2d)
;;
;; Author: Bastien / https://bzg.fr
;;
;; First make sure you read this text by Peter Norvig:
;; http://norvig.com/21-days.html
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

(read-from-minibuffer "Enter your name: ")

(defun greeting (from-name)
  (let ((your-name (read-from-minibuffer "Enter your name: ")))
    (switch-to-buffer-other-window "*test*")
    (erase-buffer)
    (insert (format "Hello %s!\n\nI am %s." your-name from-name))
    (other-window 1)))

(greeting "Uncle Bob")

;; Store a list of names

;; Take a breath.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Let's store a list of names:
(setq list-of-names '("Sarah" "Chloe" "Mathilde"))

;; Get the first element of this list with `car':
(car list-of-names)

;; Get a list of all but the first element with `cdr':
(cdr list-of-names)

;; Add an element to the beginning of a list with `push':
(push "Stephanie" list-of-names)

;; NOTE: `car' and `cdr' don't modify the list, but `push' does.
;; This is an important difference: some functions don't have any
;; side-effects (like `car') while others have (like `push').

;; Let's call `hello' for each element in `list-of-names':
(mapcar 'hello list-of-names)
;; Hello Stephanie!
;; Hello Sarah!
;; Hello Chloe!
;; Hello Mathilde!

;; Refine `greeting' to say hello to everyone in `list-of-names':
(defun greeting ()
    (switch-to-buffer-other-window "*test*")
    (erase-buffer)
    (mapcar 'hello list-of-names)
    (other-window 1))

(greeting)

;; Remember the `hello' function we defined above?  It takes one
;; argument, a name.  `mapcar' calls `hello', successively using each
;; element of `list-of-names' as the argument for `hello'.

;; Now let's arrange a bit what we have in the displayed buffer:

(defun replace-hello-by-bonjour ()
    (switch-to-buffer-other-window "*test*")
    (goto-char (point-min))
    (while (search-forward "Hello")
      (replace-match "Bonjour"))
    (other-window 1))

;; (goto-char (point-min)) goes to the beginning of the buffer.
;; (search-forward "Hello") searches for the string "Hello".
;; (while x y) evaluates the y sexp(s) while x returns something.
;; If x returns `nil' (nothing), we exit the while loop.

(replace-hello-by-bonjour)

;; You should see all occurrences of "Hello" in the *test* buffer
;; replaced by "Bonjour".

; You should also get an error: "Search failed: Hello".
;;
;; To avoid this error, you need to tell `search-forward' whether it
;; should stop searching at some point in the buffer, and whether it
;; should silently fail when nothing is found:

;; (search-forward "Hello" nil t) does the trick:

;; The `nil' argument says: the search is not bound to a position.
;; The `t' argument says: silently fail when nothing is found.

;; We use this sexp in the function below, which doesn't throw an error:

(defun hello-to-bonjour ()
    (switch-to-buffer-other-window "*test*")
    (erase-buffer)
    ;; Say hello to names in `list-of-names'
    (mapcar 'hello list-of-names)
    (goto-char (point-min))
    ;; Replace "Hello" by "Bonjour"
    (while (search-forward "Hello" nil t)
      (replace-match "Bonjour"))
    (other-window 1))

(hello-to-bonjour)


;; Let's colorize the names:

(defun boldify-names ()
    (switch-to-buffer-other-window "*test*")
    (goto-char (point-min))
    (while (re-search-forward "Bonjour \\(.+\\)!" nil t)
      (add-text-properties (match-beginning 1)
                           (match-end 1)
                           (list 'face 'bold)))
    (other-window 1))

;; This functions introduces `re-search-forward': instead of
;; searching for the string "Bonjour", you search for a pattern,
;; using a "regular expression" (abbreviated in the prefix "re-").

;; The regular expression is "Bonjour \\(.+\\)!" and it reads:
;; the string "Bonjour ", and
;; a group of           | this is the \\( ... \\) construct
;;   any character      | this is the .
;;   possibly repeated  | this is the +
;; and the "!" string.

;; Ready?  Test it!

(boldify-names)

;; `add-text-properties' adds... text properties, like a face.

;; OK, we are done.  Happy hacking!

;; If you want to know more about a variable or a function:
;;
;; C-h v a-variable RET
;; C-h f a-function RET
;;
;; To read the Emacs Lisp manual with Emacs:
;;
;; C-h i m elisp RET
;;
;; To read an online introduction to Emacs Lisp:
;; https://www.gnu.org/software/emacs/manual/html_node/eintr/index.html

;; Thanks to these people for their feedback and suggestions:
;; - Wes Hardaker
;; - notbob
;; - Kevin Montuori
;; - Arne Babenhauserheide
;; - Alan Schmitt
;; - LinXitoW
;; - Aaron Meurer




