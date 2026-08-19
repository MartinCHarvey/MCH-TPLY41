
(* lexical analyzer template (TP Lex V3.0), V1.0 3-2-91 AG  - MCH OO Mod 1*)

  (* global definitions: *)


unit
  calc_oo_lex;

interface

uses
  lexlib_oo;



type
  TCalcLexer = class(TPLYLexer)
    public
      function yylex: integer; override;
      { Sample commented def }
  end;

implementation


  (* local definitions: *)



uses
 calc_oo_parse;



function TCalcLexer.yylex : Integer;

procedure yyaction ( yyruleno : Integer );

begin
  (* actions: *)
  case yyruleno of
  1:
                        return(_ident);
  2:
                        return(_number);
  3:
                        return(_plus);
  4:
                        return(_minus);
  5:
                        return(_mul);
  6:
                        return(_div);
  7:
                        return(_lparen);
  8:
                        return(_rparen);
  9:
                ;
  10:
                ;
  11:
                ;
  12:
                ;
  13:
                        return(_semi);
  14:
                        return(_eq);
  15:
                        return (LEX_ERROR);

  end;
end(*yyaction*);

(* DFA table: *)

type YYTRec = record
                cc : set of AnsiChar;
                s  : Integer;
              end;

const

yynmarks   = 29;
yynmatches = 29;
yyntrans   = 34;
yynstates  = 19;

yyk : array [1..yynmarks] of Integer = (
  { 0: }
  { 1: }
  { 2: }
  15,
  { 3: }
  2,
  15,
  { 4: }
  3,
  15,
  { 5: }
  4,
  15,
  { 6: }
  5,
  15,
  { 7: }
  6,
  15,
  { 8: }
  7,
  15,
  { 9: }
  8,
  15,
  { 10: }
  9,
  15,
  { 11: }
  10,
  15,
  { 12: }
  11,
  15,
  { 13: }
  12,
  { 14: }
  13,
  15,
  { 15: }
  14,
  15,
  { 16: }
  15,
  { 17: }
  1,
  { 18: }
  2
);

yym : array [1..yynmatches] of Integer = (
{ 0: }
{ 1: }
{ 2: }
  15,
{ 3: }
  2,
  15,
{ 4: }
  3,
  15,
{ 5: }
  4,
  15,
{ 6: }
  5,
  15,
{ 7: }
  6,
  15,
{ 8: }
  7,
  15,
{ 9: }
  8,
  15,
{ 10: }
  9,
  15,
{ 11: }
  10,
  15,
{ 12: }
  11,
  15,
{ 13: }
  12,
{ 14: }
  13,
  15,
{ 15: }
  14,
  15,
{ 16: }
  15,
{ 17: }
  1,
{ 18: }
  2
);

yyt : array [1..yyntrans] of YYTrec = (
{ 0: }
  ( cc: [ #1..#8,#11,#12,#14..#31,'!'..'''',',','.',
            ':','<','>'..'@','['..'`','{'..#255 ]; s: 16),
  ( cc: [ #9 ]; s: 11),
  ( cc: [ #10 ]; s: 13),
  ( cc: [ #13 ]; s: 12),
  ( cc: [ ' ' ]; s: 10),
  ( cc: [ '(' ]; s: 8),
  ( cc: [ ')' ]; s: 9),
  ( cc: [ '*' ]; s: 6),
  ( cc: [ '+' ]; s: 4),
  ( cc: [ '-' ]; s: 5),
  ( cc: [ '/' ]; s: 7),
  ( cc: [ '0'..'9' ]; s: 3),
  ( cc: [ ';' ]; s: 14),
  ( cc: [ '=' ]; s: 15),
  ( cc: [ 'A'..'Z','a'..'z' ]; s: 2),
{ 1: }
  ( cc: [ #1..#8,#11,#12,#14..#31,'!'..'''',',','.',
            ':','<','>'..'@','['..'`','{'..#255 ]; s: 16),
  ( cc: [ #9 ]; s: 11),
  ( cc: [ #10 ]; s: 13),
  ( cc: [ #13 ]; s: 12),
  ( cc: [ ' ' ]; s: 10),
  ( cc: [ '(' ]; s: 8),
  ( cc: [ ')' ]; s: 9),
  ( cc: [ '*' ]; s: 6),
  ( cc: [ '+' ]; s: 4),
  ( cc: [ '-' ]; s: 5),
  ( cc: [ '/' ]; s: 7),
  ( cc: [ '0'..'9' ]; s: 3),
  ( cc: [ ';' ]; s: 14),
  ( cc: [ '=' ]; s: 15),
  ( cc: [ 'A'..'Z','a'..'z' ]; s: 2),
{ 2: }
  ( cc: [ '0'..'9','A'..'Z','_','a'..'z' ]; s: 17),
{ 3: }
  ( cc: [ '0'..'9' ]; s: 18),
{ 4: }
{ 5: }
{ 6: }
{ 7: }
{ 8: }
{ 9: }
{ 10: }
{ 11: }
{ 12: }
{ 13: }
{ 14: }
{ 15: }
{ 16: }
{ 17: }
  ( cc: [ '0'..'9','A'..'Z','_','a'..'z' ]; s: 17),
{ 18: }
  ( cc: [ '0'..'9' ]; s: 18)
);

yykl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 2,
{ 4: } 4,
{ 5: } 6,
{ 6: } 8,
{ 7: } 10,
{ 8: } 12,
{ 9: } 14,
{ 10: } 16,
{ 11: } 18,
{ 12: } 20,
{ 13: } 22,
{ 14: } 23,
{ 15: } 25,
{ 16: } 27,
{ 17: } 28,
{ 18: } 29
);

yykh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 1,
{ 3: } 3,
{ 4: } 5,
{ 5: } 7,
{ 6: } 9,
{ 7: } 11,
{ 8: } 13,
{ 9: } 15,
{ 10: } 17,
{ 11: } 19,
{ 12: } 21,
{ 13: } 22,
{ 14: } 24,
{ 15: } 26,
{ 16: } 27,
{ 17: } 28,
{ 18: } 29
);

yyml : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 2,
{ 4: } 4,
{ 5: } 6,
{ 6: } 8,
{ 7: } 10,
{ 8: } 12,
{ 9: } 14,
{ 10: } 16,
{ 11: } 18,
{ 12: } 20,
{ 13: } 22,
{ 14: } 23,
{ 15: } 25,
{ 16: } 27,
{ 17: } 28,
{ 18: } 29
);

yymh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 1,
{ 3: } 3,
{ 4: } 5,
{ 5: } 7,
{ 6: } 9,
{ 7: } 11,
{ 8: } 13,
{ 9: } 15,
{ 10: } 17,
{ 11: } 19,
{ 12: } 21,
{ 13: } 22,
{ 14: } 24,
{ 15: } 26,
{ 16: } 27,
{ 17: } 28,
{ 18: } 29
);

yytl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 16,
{ 2: } 31,
{ 3: } 32,
{ 4: } 33,
{ 5: } 33,
{ 6: } 33,
{ 7: } 33,
{ 8: } 33,
{ 9: } 33,
{ 10: } 33,
{ 11: } 33,
{ 12: } 33,
{ 13: } 33,
{ 14: } 33,
{ 15: } 33,
{ 16: } 33,
{ 17: } 33,
{ 18: } 34
);

yyth : array [0..yynstates-1] of Integer = (
{ 0: } 15,
{ 1: } 30,
{ 2: } 31,
{ 3: } 32,
{ 4: } 32,
{ 5: } 32,
{ 6: } 32,
{ 7: } 32,
{ 8: } 32,
{ 9: } 32,
{ 10: } 32,
{ 11: } 32,
{ 12: } 32,
{ 13: } 32,
{ 14: } 32,
{ 15: } 32,
{ 16: } 32,
{ 17: } 33,
{ 18: } 34
);


var yyn : Integer;

label start, scan, action;

begin

start:

  (* initialize: *)

  yynew;

scan:

  (* mark positions and matches: *)

  for yyn := yykl[yystate] to     yykh[yystate] do yymark(yyk[yyn]);
  for yyn := yymh[yystate] downto yyml[yystate] do yymatch(yym[yyn]);

  if yytl[yystate]>yyth[yystate] then
  begin
    yytoken_overrun := false;
    goto action; (* dead state *)
  end;

  (* get next character: *)

  yyscan;

  (* determine action: *)

  yyn := yytl[yystate];
  while (yyn<=yyth[yystate]) and not (yyactchar in yyt[yyn].cc) do inc(yyn);
  if yyn>yyth[yystate] then
  begin
    yytoken_overrun := true;
    goto action;
  end;
    (* no transition on yyactchar in this state *)

  (* switch to new state: *)

  yystate := yyt[yyn].s;

  goto scan;

action:

  (* execute action: *)

  if yyfind(yyrule) then
    begin
      yyaction(yyrule);
      if yyreject then goto action;
    end
  else if not yydefault and yywrap then
    begin
      yyclear;
      return(0);
    end;

  if not yydone then goto start;

  update_token_text;

  yylex := yyretval;

end(*yylex*);



end.


