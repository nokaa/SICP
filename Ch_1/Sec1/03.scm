(define (sum-of-larger a b c)
  (cond ((and (< a b) (< a c)) (sum-of-squares b c))
        ((and (< b a) (< b c)) (sum-of-squares a c))
        (else (sum-of-squares a b))))

(define (sum-of-squares a b)
  (+ (square a) (square b)))

(define (square a)
  (* a a))
