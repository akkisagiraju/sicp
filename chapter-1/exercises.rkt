#lang sicp

; 1.2
(/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5)))))(* 3 (- 6 2) (- 2 7)))

; 1.3

(define (sum-of-large-squares a b c)
        (cond ((> a b)
               (cond ((> b c) (sum-of-squares a b))
                    (else (sum-of-squares a c))))
              ((> b a)
               (cond ((> a c) (sum-of-squares b a))
                    (else (sum-of-squares b c))))))

(define (square x) (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(sum-of-large-squares 7 5 6)

; 1.4
(define (p) (p))
(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))

sqrt evaluation
(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (/ (abs (- (square guess) x)) guess) 0.001))

(define (abs x)
  (if (< x 0)
    (- x)
    x))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
    (else else-clause)))

(define (cube x) (* x x x))

(define (cubrt-iter guess x)
  (if (good-enough-root? guess x)
    guess
    (cubrt-iter (improvecrt guess x) x)))

(define (improvecrt guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough-root? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (cubrt x)
  (cubrt-iter 1.0 x))

(cubrt (* 2 2 2))

(sqrt (square 0.002))

; 1.10
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1) (A x (- y 1))))))

(A 3 3)