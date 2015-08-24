(defmodule horatio-exp
  (export (pow 2)))

(include-lib "horatio/include/data-types.lfe")

(defun pow
  ((_ 0)
   (ratio:new 1 1))
  ((r n) (when (is_integer r))
   (ratio:new (trunc (math:pow r n)) 1))
  (((match-ratio numer num denom den) n) (when (>= n 1))
   (ratio:new (trunc (math:pow num n))
              (trunc (math:pow den n))))
  (((match-ratio numer num denom den) n) (when (=< n -1))
   (ratio:new (trunc (math:pow den n))
              (trunc (math:pow num n)))))
