(defmodule unit-horatio-arith-tests
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

(deftest sub
  (is-equal #(ratio 1 -4)
            (ratio:sub (ratio:new 1 2)
                       (ratio:new 3 4)))
  (is-equal #(ratio 1 -4)
            (ratio:sub (ratio:new -1 -2)
                       (ratio:new -3 -4)))
  (is-equal #(ratio 1 4)
            (ratio:sub (ratio:new -1 2)
                       (ratio:new -3 4)))
  (is-equal #(ratio 1 4)
            (ratio:sub (ratio:new 1 -2)
                       (ratio:new 3 -4))))

(deftest mult
  (is-equal #(ratio 3 8)
            (ratio:mult (ratio:new 1 2)
                        (ratio:new 3 4)))
  (is-equal #(ratio 3 8)
            (ratio:mult (ratio:new -1 -2)
                        (ratio:new -3 -4)))
  (is-equal #(ratio 3 8)
            (ratio:mult (ratio:new -1 2)
                        (ratio:new -3 4)))
  (is-equal #(ratio -3 8)
            (ratio:mult (ratio:new 1 2)
                        (ratio:new 3 -4))))

(deftest div
  (is-equal #(ratio 2 3)
            (ratio:div (ratio:new 1 2)
                        (ratio:new 3 4)))
  (is-equal #(ratio 2 3)
            (ratio:div (ratio:new -1 -2)
                        (ratio:new -3 -4)))
  (is-equal #(ratio 2 3)
            (ratio:div (ratio:new -1 2)
                        (ratio:new -3 4)))
  (is-equal #(ratio 2 -3)
            (ratio:div (ratio:new 1 2)
                        (ratio:new 3 -4))))
