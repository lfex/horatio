(defmodule unit-horatio-tests
  (behaviour ltest-unit)
  (export all)
  (import
    (from ltest
      (check-failed-assert 2)
      (check-wrong-assert-exception 2))))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest new-numer-denom
  (is-equal #(ratio 1 2) (ratio:new 1 2)))

(deftest new-from-list
  (is-equal #(ratio -3 8) (ratio:new "-3/8")))

(deftest new-from-atom
  (is-equal #(ratio 5 15) (ratio:new '5/15)))

(deftest new-from-tuple
  (is-equal #(ratio 45 17) (ratio:new #(45 17))))

