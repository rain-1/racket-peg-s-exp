#lang racket

(require rackunit)

(require peg)
(require "parser.rkt")
(require "transformer.rkt")

(check-equal?
 (s-exp->scheme (peg s-exp "(\"foo bar\" baz (#t 244))"))
 '("foo bar" baz (#t 244)))

;; spacing test
(check-equal?
 (s-exp->scheme (peg s-exp "(a b c)"))
 '(a b c))
(check-equal?
 (s-exp->scheme (peg s-exp "( a b c)"))
 '(a b c))
(check-equal?
 (s-exp->scheme (peg s-exp "(a b c )"))
 '(a b c))


;; quote, unquote and quasiquote test
(check-equal?
 (s-exp->scheme (peg s-exp "'(a b c)"))
 '(quote (a b c)))
 
(check-equal?
 (s-exp->scheme (peg s-exp "`(a b ,(c d e))"))
 '(quasiquote (a b (unquote (c d e)))))

;; + and numbers
(check-equal?
 (s-exp->scheme (peg s-exp "(+ 1 2)"))
 '(+ 1 2))
