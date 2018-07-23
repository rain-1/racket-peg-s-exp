#lang peg

_ < [ \t\n]*;
OB < '(' ;
CB < ')' ;
DQ < ["] ;

s-exp <- atom / list ;
atom <- boolean / symbol / number / string ;
list <-- OB (_ s-exp)*  CB ;

boolean <-- '#t' / '#f' ;
symbol <-- [a-zA-Z\-]+ ;
number <-- [0-9]+ ;
string <-- DQ [^"]* DQ ;
