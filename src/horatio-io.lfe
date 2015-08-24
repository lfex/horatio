(defmodule horatio-io
  (export (print 1)))

(include-lib "horatio/include/data-types.lfe")

;; Pretty-print:
;;
;; > (complex:print c1)
;; 1+2i
;; ok
;; > (complex:print c2)
;; 3-5i
;; ok

(defun print
  (((= (match-ratio) r))
   (io:format (++ (ratio:->str r) "~n")))
  ((x)
   (io:format "~p~n" (list x))))

(defun pp (r)
  (print r))
