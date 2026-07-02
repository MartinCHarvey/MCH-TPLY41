
%{

unit
  calc_oo_lex;

interface

{$DEFINE OO_LEXLIB}

uses
  lexlib_oo;

function yylex: integer;

implementation

uses
  calc_oo_parse;

%}

%%

[A-Za-z][A-Za-z0-9_]+   return(_ident);
[0-9]+                  return(_number);
+                       return(_plus);
-                       return(_minus);
*                       return(_mul);
\/                      return(_div);
\(                      return(_lparen);
\)                      return(_rparen);
[ ]             ;
\t              ;
\r              ;
\n              ;
;                       return(_semi);
=                       return(_eq);

%%

end.


