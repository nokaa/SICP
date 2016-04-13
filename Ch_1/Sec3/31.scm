(define (prod term a next b)
    (if (> a b)
        1
        (* (term a)
           (prod term (next a) next b))))

(define (ident x) x)

(define (fact b)
    (prod ident 1 inc b))

(define (pi-prod n)
    (define (pi-term x)
        (if (even? x)
            (/ (+ x 2) (+ x 1))
            (/ (+ x 1) (+ x 2))))
    (* 4.0 (prod pi-term 1 inc n)))

(define (prod-iter term a next b)
    (define (iter a result)
        (if (a > b)
            result
            (iter (next a) (* (term a) result))))
    (iter a 1))
