(defmodule horatio-util
  (export (get-version 0)
          (get-versions 0)
          (gcd 2)
          (->str 1)
          (->atom 1)
          (->float 1)
          (normalize 1) (normalize 2)
          (fix-sign 1) (fix-sign 2)
          (float->ratio 1)
          (print-api-functions 0)))

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
  ((a b)
   (gcd b (rem a b))))

(defun ->str
  (((match-ratio numer n denom d))
   (lists:flatten
     (io_lib:format "~p/~p" `(,n ,d)))))

(defun ->atom (ratio)
  (list_to_atom (->str ratio)))

(defun ->float
  (((match-ratio numer n denom d))
   (/ n d)))

(defun normalize
  (((match-ratio numer n denom d))
   (normalize n d)))

(defun normalize (numer denom)
  (let ((g (gcd numer denom)))
    (ratio:new (trunc (/ numer g))
               (trunc (/ denom g)))))

(defun fix-sign
  (((match-ratio numer n denom d))
   (fix-sign n d)))

(defun fix-sign (n d)
  (cond ((and (< n 0) (< d 0))
         (list (abs n) (abs d)))
        ((< d 0)
         (list (* -1 n) (abs d)))
        ('true
         (list n d))))

(defun float->ratio
  ((f) (when (is_float f))
   (let* ((fl (float_to_list f '(#(decimals 20))))
          (`(,int ,dec) (string:tokens fl "."))
          (numer (list_to_integer (++ int dec)))
          (denom (trunc (math:pow 10 (length dec)))))
     (normalize numer denom))))

(defun check-function
  ((`#(,func-name ,arity))
   (let ((skip '(module_info
                 get-version
                 get-versions
                 loaded-ratio-data-types
                 loaded-ratio-api
                 loaded-ratio
                 fix-sign
                 print-api-functions)))
     (if (lists:member func-name skip)
       'false
       `#(true #(,func-name ,arity))))))

(defun get-api-functions ()
  (lists:filtermap
   #'check-function/1
   (proplists:get_value 'exports (ratio:module_info))))

(defun print-function
  ((`#(,func-name ,arity))
   (lfe_io:format "ratio:~p/~p~n" `(,func-name ,arity))))

(defun print-api-functions ()
  (lists:foreach
   #'print-function/1
   (lists:sort (get-api-functions))))
