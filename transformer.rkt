#lang racket

(require peg)
(require "parser.rkt")

(provide s-exp->scheme)

(define (s-exp->scheme s-exp)
  (match s-exp
    (`(boolean . "#t") #t)
    (`(boolean . "#f") #f)

    (`(symbol . ,s) (string->symbol s))

    (`(number . ,n) (string->number n))

    (`(string . ,s) s)

    (`(list . ,xs) (map s-exp->scheme xs))
    
    (`(quot . ,xs) (quote (s-exp->scheme xs)))
    
    (`(quasiquot . ,xs) (quasiquote (s-exp->scheme xs)))
    
    (`(unquot . ,xs) (unquote (s-exp->scheme xs)))
    
    (else (error 's-exp->scheme "not an s-expression AST ~a" s-exp))))
