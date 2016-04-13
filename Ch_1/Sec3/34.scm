(define (f g)
  (g 2))

(f square) ;; 4

(f (lambda (z) (* z (+ z 1)))) ;; 6

;; An error is thrown because `(f f)` expands
;; to `(f 2)` which expands to `(2 2)` which
;; is invalid as the first argument must be
;; a procedure.
(f f)
