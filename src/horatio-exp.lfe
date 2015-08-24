(defmodule horatio-exp
  (export (pow 2)))

(include-lib "horatio/include/data-types.lfe")

(defun pow
  ((z 0)
   (ratio:new 1 1))
  ((z n) (when (is_integer z))
   (ratio:new (math:pow z n) 1))
  ((z n) (when (>= n 1))
   (positive-integer-powers z n))
  ((z n) (when (=< n -1))
   (negative-integer-powers z n)))

(defun positive-integer-powers (z n)
  (lists:foldl (lambda (x acc)
                 (ratio:mult x acc))
               (ratio:new 1 1)
               (lists:duplicate n z)))

(defun negative-integer-powers (z n)
  (ratio:div (ratio:new 1 1)
             (positive-integer-powers z (abs n))))
