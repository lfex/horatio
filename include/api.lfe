(defmacro generate-ratio-api-wrappers ()
  `(progn ,@(kla:wrap-mod-funcs 'horatio)
          ,@(kla:wrap-mod-funcs 'horatio-arith)
          ,@(kla:wrap-mod-funcs 'horatio-io)
          ,@(kla:wrap-mod-funcs 'horatio-ops)
          ,@(kla:wrap-mod-funcs 'horatio-exp)
          ,@(kla:wrap-mod-funcs 'horatio-util)))

(generate-ratio-api-wrappers)

(defun loaded-ratio-api ()
  "This is just a dummy function for display purposes when including from the
  REPL (the last function loaded has its name printed in stdout).
  This function needs to be the last one in this include."
  'ok)
