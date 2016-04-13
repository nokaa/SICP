(define (cube x) (* x x x))

;; We assume that n is even
(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (simpson-term k)
    (define y (f (+ a (* k h))))
    (if (or (= k 0) (= k n))
        (* 1 y)
        (if (even? k)
            (* 2 y)
            (* 4 y))))
  (* (/ h 3) (sum simpson-term 0 inc n)))

(simpson cube 0 1 100)

(simpson cube 0 1 1000)
