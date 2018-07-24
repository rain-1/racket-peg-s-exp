#lang peg

_ < [ \t\n]*;
OB < '(' ;
CB < ')' ;
DQ < ["] ;
s-exp <- atom / list / quot / quasiquot / unquot ; //if I use quote, quasiquote or unquote as a name, the peg->scheme don't accept
atom <- boolean / symbol / number / string ;
list <-- OB _ (s-exp _)*  CB ;
boolean <-- '#t' / '#f' ;
symbol <-- [a-zA-Z\-]+ ;
number <-- [0-9]+ ;
string <-- DQ [^"]* DQ ;

SQ < '\'' ;
BQ < '`' ;
COMMA < ',' ;

quot <-- SQ s-exp ;
quasiquot <-- BQ s-exp ;
unquot <-- COMMA s-exp ;
