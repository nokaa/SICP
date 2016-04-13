;; Due To the way that scheme evaluates expressions, if we call
;; (square (expmod base (/ exp 2) m))
;; the expression (expmod base (/ exp 2) m) is only evaluated once.
;; In Louis' function, the expression is evaluated twice for each call,
;; which causes an exponential increase in running time.
