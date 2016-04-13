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
        (else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n) (* n n))

(define (next n)
  (if (= n 2)
    3
    (+ 2 n)))

(define (search-for-primes low high)
  (if (= low high) (timed-prime-test low)
      (begin (timed-prime-test low)
       (search-for-primes (+ 1 low) high))))

(begin (search-for-primes 1000 1019) (newline)) ;; 1009, 1013, 1019
(begin (search-for-primes 10000 10037) (newline)) ;; 10007, 10009, 10037
(begin (search-for-primes 100000 100043) (newline)) ;; 100003, 100019, 100043
(begin (search-for-primes 1000000 1000037) (newline)) ;; 1000003, 1000033, 1000037
(timed-prime-test 1000037)

;; It is impossible for me to check if there has been any speedup, as the times returned are all zero. It appears
;; that either modern computers are many times faster, or that racket's timing is lacking. I suspect the problem
;; lies with the latter.
