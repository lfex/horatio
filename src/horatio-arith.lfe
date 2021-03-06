(defmodule horatio-arith
  (export (add 2)
          (sub 2)
          (mult 2)
          (div 2)))

(include-lib "horatio/include/data-types.lfe")

(defun add
  (((match-ratio numer num-a denom den-a)
    (match-ratio numer num-b denom den-b))
   (ratio:normalize
     (ratio:new (+ (* num-a den-b) (* den-a num-b))
                   (* den-a den-b)))))

(defun sub
  (((match-ratio numer num-a denom den-a)
    (match-ratio numer num-b denom den-b))
   (ratio:normalize
     (ratio:new (- (* num-a den-b) (* den-a num-b))
                   (* den-a den-b)))))

(defun mult
  (((match-ratio numer num-a denom den-a)
    (match-ratio numer num-b denom den-b))
   (ratio:normalize
     (ratio:new (* num-a num-b)
                (* den-a den-b)))))

(defun div
  (((match-ratio numer num-a denom den-a)
    (match-ratio numer num-b denom den-b))
   (ratio:normalize
     (ratio:new (* num-a den-b)
                (* den-a num-b)))))

