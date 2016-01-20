(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

;; When using this to compute square roots, the interpreter seems to enter an infinite loop.
;; This is because in its special form, `if' uses normal order evaluation. Our `new-if' uses
;; applicative order evaluation, and because of this we keep evaluating the third argument to
;; `new-if', in this case a recursive call to `sqrt-iter'.
