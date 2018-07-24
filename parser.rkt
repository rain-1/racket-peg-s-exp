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

quote <-- '\'' s-exp ;
quasiquote <-- '`' s-exp ;
unquote <-- ',' s-exp ;
