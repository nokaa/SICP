;; We are using the tolerance of 0.001, which can be very large for small numbers,
;; causing large inaccuracies. This tolerance is also too little for large numbers,
;; also causing inaccuracies.

(define (good-enough? guess x)
  (< (abs (/ (- (improve guess x) guess)
             guess))
     0.001))
