
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

  end;
end(*yyaction*);

(* DFA table: *)

type YYTRec = record
                cc : set of AnsiChar;
                s  : Integer;
              end;

const

yynmarks   = 14;
yynmatches = 14;
yyntrans   = 31;
yynstates  = 17;

yyk : array [1..yynmarks] of Integer = (
  { 0: }
  { 1: }
  { 2: }
  { 3: }
  2,
  { 4: }
  3,
  { 5: }
  4,
  { 6: }
  5,
  { 7: }
  6,
  { 8: }
  7,
  { 9: }
  8,
  { 10: }
  9,
  { 11: }
  10,
  { 12: }
  11,
  { 13: }
  12,
  { 14: }
  13,
  { 15: }
  14,
  { 16: }
  1
);

yym : array [1..yynmatches] of Integer = (
{ 0: }
{ 1: }
{ 2: }
{ 3: }
  2,
{ 4: }
  3,
{ 5: }
  4,
{ 6: }
  5,
{ 7: }
  6,
{ 8: }
  7,
{ 9: }
  8,
{ 10: }
  9,
{ 11: }
  10,
{ 12: }
  11,
{ 13: }
  12,
{ 14: }
  13,
{ 15: }
  14,
{ 16: }
  1
);

yyt : array [1..yyntrans] of YYTrec = (
{ 0: }
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
  ( cc: [ '0'..'9','A'..'Z','_','a'..'z' ]; s: 16),
{ 3: }
  ( cc: [ '0'..'9' ]; s: 3),
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
  ( cc: [ '0'..'9','A'..'Z','_','a'..'z' ]; s: 16)
);

yykl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 1,
{ 4: } 2,
{ 5: } 3,
{ 6: } 4,
{ 7: } 5,
{ 8: } 6,
{ 9: } 7,
{ 10: } 8,
{ 11: } 9,
{ 12: } 10,
{ 13: } 11,
{ 14: } 12,
{ 15: } 13,
{ 16: } 14
);

yykh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 0,
{ 3: } 1,
{ 4: } 2,
{ 5: } 3,
{ 6: } 4,
{ 7: } 5,
{ 8: } 6,
{ 9: } 7,
{ 10: } 8,
{ 11: } 9,
{ 12: } 10,
{ 13: } 11,
{ 14: } 12,
{ 15: } 13,
{ 16: } 14
);

yyml : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 1,
{ 3: } 1,
{ 4: } 2,
{ 5: } 3,
{ 6: } 4,
{ 7: } 5,
{ 8: } 6,
{ 9: } 7,
{ 10: } 8,
{ 11: } 9,
{ 12: } 10,
{ 13: } 11,
{ 14: } 12,
{ 15: } 13,
{ 16: } 14
);

yymh : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 0,
{ 2: } 0,
{ 3: } 1,
{ 4: } 2,
{ 5: } 3,
{ 6: } 4,
{ 7: } 5,
{ 8: } 6,
{ 9: } 7,
{ 10: } 8,
{ 11: } 9,
{ 12: } 10,
{ 13: } 11,
{ 14: } 12,
{ 15: } 13,
{ 16: } 14
);

yytl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 15,
{ 2: } 29,
{ 3: } 30,
{ 4: } 31,
{ 5: } 31,
{ 6: } 31,
{ 7: } 31,
{ 8: } 31,
{ 9: } 31,
{ 10: } 31,
{ 11: } 31,
{ 12: } 31,
{ 13: } 31,
{ 14: } 31,
{ 15: } 31,
{ 16: } 31
);

yyth : array [0..yynstates-1] of Integer = (
{ 0: } 14,
{ 1: } 28,
{ 2: } 29,
{ 3: } 30,
{ 4: } 30,
{ 5: } 30,
{ 6: } 30,
{ 7: } 30,
{ 8: } 30,
{ 9: } 30,
{ 10: } 30,
{ 11: } 30,
{ 12: } 30,
{ 13: } 30,
{ 14: } 30,
{ 15: } 30,
{ 16: } 31
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

{$IFDEF OO_LEXLIB}
  update_token_text;
{$ENDIF}

  yylex := yyretval;

end(*yylex*);



end.


