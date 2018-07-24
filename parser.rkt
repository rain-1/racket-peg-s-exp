#lang peg

_ < [ \t\n]*;
OB < '(' ;
CB < ')' ;
DQ < ["] ;

s-exp <- atom / list / quote / quasiquote / unquote ;
atom <- boolean / symbol / number / string ;
list <-- OB _ (s-exp _)*  CB ;
boolean <-- '#t' / '#f' ;
symbol <-- [a-zA-Z\-]+ ;
number <-- [0-9]+ ;
string <-- DQ [^"]* DQ ;

SQ < '\'' ;
BQ < '`' ;
COMMA < ',' ;

quote <-- SQ _ s-exp ;
quasiquote <-- BQ _ s-exp ;
unquote <-- COMMA _ s-exp ;
