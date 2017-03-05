(defun assertion(actual)
    (setf expected (make-list-from-file "capture.txt"))   
    (print (equal expected (list actual)))
)

(defun make-list-from-file (filename)
  (with-open-file (in filename)
    (loop for line = (read-line in nil nil)
       while line
       collect (read-from-string line))))