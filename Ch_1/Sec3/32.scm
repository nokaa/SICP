(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (ident x) x)

(define (cube x) (* x x x))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (prod term a next b)
  (accumulate * 1 term a next b))

(define (fact n) (prod ident 1 inc n))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter x res)
    (if (> x b)
        res
        (iter (next x) (combiner res (term x)))))
  (iter a null-value))
