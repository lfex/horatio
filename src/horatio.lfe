(defmodule horatio
  (export (new 1) (new 2)
          (ratio 1) (ratio 2)
          (numer 1)
          (denom 1)))

(include-lib "horatio/include/data-types.lfe")

(defun new (num den)
  (let ((`(,num ,den) (ratio:fix-sign num den)))
    (make-ratio numer num denom den)))

(defun new
  ((ratio) (when (is_list ratio))
   (apply #'new/2 (lists:map #'list_to_integer/1
                            (string:tokens ratio "/"))))
  ((ratio) (when (is_atom ratio))
   (new (atom_to_list ratio)))
  ((ratio) (when (is_tuple ratio))
   (apply #'new/2 (tuple_to_list ratio))))

(defun ratio (ratio)
  (new ratio))

(defun ratio (num den)
  (new num den))

(defun numer (ratio)
  (ratio-numer ratio))

(defun denom (ratio)
  (ratio-denom ratio))
