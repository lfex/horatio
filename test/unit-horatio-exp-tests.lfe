(defmodule unit-horatio-exp-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest pow-pos
  (is-equal #(ratio 1 8) (ratio:pow (ratio:new '1/2) 3)))

(deftest pow-neg
  (is-equal #(ratio 1024 1) (ratio:pow (ratio:new 1 4) -5))
  (is-equal #(ratio 81 1) (ratio:pow (ratio:new "1/3") -4))
  (is-equal #(ratio 8 1) (ratio:pow (ratio:new '1/2) -3)))

(deftest pow-one
  (is-equal #(ratio 1 2) (ratio:pow (ratio:new '1/2) 1)))

(deftest pow-zero
  (is-equal #(ratio 1 1) (ratio:pow (ratio:new '1/2) 0)))

