#lang racket

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-milliseconds)))

(define (start-prime-test n start-time)
  (cond ((prime? n)
    (report-prime (- (current-milliseconds) start-time)))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n) (* n n))

(define (search-for-primes low high)
  (if (= low high) (timed-prime-test low)
      (begin (timed-prime-test low)
       (search-for-primes (+ 1 low) high))))

;;(begin (search-for-primes 1000 1019) (newline))
;;(begin (search-for-primes 10000 10037) (newline))
;;(begin (search-for-primes 100000 100043) (newline))
(begin (search-for-primes 1000000 1000037) (newline))
