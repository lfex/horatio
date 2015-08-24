(defmodule horatio-ops
  (export (eq 2)))

(include-lib "horatio/include/data-types.lfe")

(defun eq
  (((match-ratio numer num-a denom den-a)
    (match-ratio numer num-b denom den-b))
   (== (* num-a den-b)
       (* num-b den-a))))

