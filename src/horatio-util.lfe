(defmodule horatio-util
  (export (get-version 0)
          (get-versions 0)
          (gcd 2)
          (->str 1)
          (->atom 1)
          (->float 1)))

(include-lib "horatio/include/data-types.lfe")

(defun get-version ()
  (lutil:get-app-version 'horatio))

(defun get-versions ()
  (++ (lutil:get-versions)
      `(#(horatio ,(get-version)))))

(defun gcd
  ((a 0) a)
  ((0 b) b)
  ((a b) (when (== a b)) a)
  ((a b) (when (< (* a b) 0))
   (* -1 (gcd (abs a) (abs b))))
  ((a b)
   (if (> a b)
       (gcd (- a b) b)
       (gcd (- b a) a))))

(defun ->str
  (((match-ratio numer n denom d))
   (lists:flatten
     (io_lib:format "~p/~p" `(,n ,d)))))

(defun ->atom (ratio)
  (list_to_atom (->str ratio)))

(defun ->float
  (((match-ratio numer n denom d))
   (/ n d)))
