(defmodule unit-horatio-exp-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest pow-pos
  (is-equal #(ratio 1 8)
            (ratio:pow (ratio:new '1/2) 3)))

(deftest pow-neg
  (is-equal #(ratio 8 1)
            (ratio:pow (ratio:new '1/2) -3)))

(deftest pow-zero
  (is-equal #(ratio 1 1)
            (ratio:pow (ratio:new '1/2) 0)))
