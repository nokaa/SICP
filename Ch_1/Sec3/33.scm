(define (filtered-accumulate combiner null-value term a next b filt)
  (if (> a b)
      null-value
      (if (filt a)
          (combiner (term a) (filtered-accumulate combiner 
                                                  null-value
                                                  term
                                                  (next a)
                                                  next
                                                  b
                                                  filt))
          (filtered-accumulate combiner
                               null-value
                               term
                               (next a)
                               next
                               b
                               filt))))


(define (smallest-div n) 
    (define (divides? a b) 
      (= 0 (remainder b a))) 
    (define (find-div n test) 
       (cond ((> (sq test) n) n) ((divides? test n) test) 
             (else (find-div n (+ test 1))))) 
    (find-div n 2)) 
  
(define (prime? n) 
  (if (= n 1) false (= n (smallest-div n)))) 

(define (sq x) (* x x))

;; a
(define (sum-prime-squares a b)
  (filtered-accumulate + 0 sq a inc b prime?))

(define (gcd m n)
  (cond ((< m n) (gcd n m))
        ((= n 0) m)
        (else (gcd n (remainder m n)))))

(define (relative-prime? m n)
  (= (gcd m n) 1))

(define (prod-rel-primes n)
  (define (filt x) (relative-prime? x n))
  (filtered-accumulate * 1 ident 1 inc n filt))
