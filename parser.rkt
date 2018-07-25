#lang peg

_ < [ \t\n]*;
OB < '(' ;
CB < ')' ;
DQ < ["] ;

s-exp <-  list / quote / quasiquote / unquote  / atom;
atom <- boolean / number / identifier/ string ;
list <-- OB _ (s-exp _)*  CB ;
boolean <-- '#t' / '#f' ;
identifier <--   [^ ()\[\]{}",'`;#|\\]+ ;
number <-- [0-9]+ ;
string <-- DQ [^"]* DQ ;

SQ < '\'' ;
BQ < '`' ;
COMMA < ',' ;

quote <-- SQ _ s-exp ;
quasiquote <-- BQ _ s-exp ;
unquote <-- COMMA _ s-exp ;
