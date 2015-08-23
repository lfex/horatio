(defmodule unit-ratio-arith-tests
  (behaviour ltest-unit)
  (export all))

(include-lib "ltest/include/ltest-macros.lfe")

(deftest add
  (is-equal #(ratio 5 4)
            (ratio:add (ratio:new 1 2)
                       (ratio:new 3 4)))

  (is-equal #(ratio 5 4)
            (ratio:add (ratio:new -1 -2)
                       (ratio:new -3 -4)))

  (is-equal #(ratio 5 -4)
            (ratio:add (ratio:new -1 2)
                       (ratio:new -3 4)))

  (is-equal #(ratio 5 -4)
            (ratio:add (ratio:new 1 -2)
                       (ratio:new 3 -4))))

