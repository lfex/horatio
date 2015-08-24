(defmodule unit-horatio-util-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest gcd
  (is-equal 5 (ratio:gcd 5 15))
  (is-equal 3 (ratio:gcd 3 15))
  (is-equal 1 (ratio:gcd 1 15))
  (is-equal 15 (ratio:gcd 15 15))
  (is-equal 15 (ratio:gcd 0 15))
  (is-equal 15 (ratio:gcd 15 0)))

(deftest ->str
  (is-equal "7/32" (ratio:->str (ratio:new 7 32))))

(deftest ->atom
  (is-equal '7/32 (ratio:->atom (ratio:new 7 32))))

(deftest ->float
  (is-equal 1.0 (ratio:->float (ratio:new 2 2)))
  (is-equal 1.0 (ratio:->float (ratio:new 2 2)))
  (is-equal 0.375 (ratio:->float (ratio:new 3 8)))
  (is-equal 0.21875 (ratio:->float (ratio:new 7 32))))

(deftest normalize
  (is-equal #(ratio 1 2) (ratio:normalize (ratio:new 1 2)))
  (is-equal #(ratio 3 -8) (ratio:normalize (ratio:new "-3/8")))
  (is-equal #(ratio 1 3) (ratio:normalize (ratio:new '5/15)))
  (is-equal #(ratio 45 17) (ratio:normalize (ratio:new #(45 17)))))

(deftest float->ratio
  (is-equal #(ratio 1 1) (ratio:float->ratio 1.0))
  (is-equal #(ratio 1 2) (ratio:float->ratio 0.5))
  (is-equal #(ratio 7 8) (ratio:float->ratio 0.875))
  (is-equal #(ratio 19 8) (ratio:float->ratio 2.375))
  (is-equal #(ratio 6795704571147613184 2500000000000000000)
            (ratio:float->ratio (math:exp 1)))
  (is-equal #(ratio 785398163397448320 250000000000000000)
            (ratio:float->ratio (math:pi))))
