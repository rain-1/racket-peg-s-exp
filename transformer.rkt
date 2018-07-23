#lang racket

(require peg)
(require "parser.rkt")

(provide s-exp->scheme)

(define (s-exp->scheme s-exp)
  (match s-exp
    (`(s-exp boolean . "#t") #t)
    (`(s-exp boolean . "#f") #f)

    (`(s-exp symbol . ,s) (string->symbol s))

    (`(s-exp number . ,n) (string->number n))

    (`(s-exp string . ,s) s)

    (`(s-exp . ,xs) (map s-exp->scheme xs))
    
    (else (error 's-exp->scheme "not an s-expression AST ~a" s-exp))))
