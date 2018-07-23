#lang racket

(require rackunit)

(require peg/peg)
(require "parser.rkt")
(require "transformer.rkt")

(check-equal?
 (s-exp->scheme (peg s-exp "(\"foo bar\" baz (#t 244))"))
 '("foo bar" baz (#t 244)))
