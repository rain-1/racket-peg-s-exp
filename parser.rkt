#lang peg

_ < [ \t\n]*;
OB < '(' ;
CB < ')' ;
DQ < ["] ;

s-exp <-- atom / OB (_ s-exp)*  CB ;
atom <- boolean / symbol / number / string ;

boolean <-- '#t' / '#f' ;
symbol <-- [a-zA-Z\-]+ ;
number <-- [0-9]+ ;
string <-- DQ [^"]* DQ ;
