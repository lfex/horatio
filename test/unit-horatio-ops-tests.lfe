(defmodule unit-horatio-ops-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest eq
  (is (ratio:eq (ratio:new '1/2)
                (ratio:new '1/2)))
  (is-not (ratio:eq (ratio:new '1/2)
                    (ratio:new '3/4))))

