(defmodule unit-ratio-util-tests
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

