#lang racket

(define (square x) (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (fast-expt-iter b n acc)
  (cond ((= n 1) acc)
        ((even? n) (fast-expt-iter b (/ n 2) (* (square b) acc)))
        (else (fast-expt-iter b (- n 1) (* b acc)))))

