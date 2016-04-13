#lang racket

(define (mult a b)
  (if (= b 0)
      0
      (+ a (mult a (- b 1)))))

(define (double x) (+ x x))
(define (halve x ) (/ x 2))

(define (fast-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast-mult a (halve b))))
        (else (+ a (fast-mult a (- b 1))))))

(define (fast-mult-iter a b acc)
  (cond ((= b 0) acc)
        ((even? b) (fast-mult-iter (double a) (halve b) acc))
        (else (fast-mult-iter a (- b 1) (+ a acc)))))
