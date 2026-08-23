
(* Yacc parser template (TP Yacc V3.0), V1.2 6-17-91 AG MCH OO Mod 1 *)

(* global definitions: *)


unit
  calc_oo_parse;

interface

uses
  calc_oo_lex, lexlib_oo, yacclib_oo, calc_oo_parse_debug,
  SysUtils, Classes;

const _number = 257;
const _plus = 258;
const _minus = 259;
const _mul = 260;
const _div = 261;
const _lparen = 262;
const _rparen = 263;
const _ident = 264;
const _semi = 265;
const _eq = 266;
const LEX_ERROR = 267;
{ oo_def }
type
  TCalcParser = class (TPLYParser)
    public
{ oo_classvars }
      yyp_result: integer;
      lastIdent, lastDef: string;
      identList: TStringList;
{.cod}

  yystate, yysp, yyn : Integer;
  yys : array [1..yymaxdepth] of Integer;
  yyv : array [1..yymaxdepth] of YYSType;
  yyval : YYSType;
  yylval : YYSType;

  function yyparse : Integer;

{ oo_classfuncs }
      procedure AddDef(ident:string; val: integer);
      function lookupLastIdent: integer;
      constructor Create;
      destructor Destroy; override;
      procedure yyerror ( msg : String ); override;
      procedure yyaction_debug(State: integer; Action: integer); override;
{ oo_impl }
  end;

implementation

function TCalcParser.yyparse : Integer;

procedure yyaction ( yyruleno : Integer );
begin
  (* actions: *)
  yyaction_debug(yystate, yyruleno);
  try
    case yyruleno of
   1 : begin
         yyp_result := yyv[yysp-0]; 
       end;
   2 : begin
         yyp_result := yyv[yysp-0]; 
       end;
   3 : begin
         yyval := yyv[yysp-0];
       end;
   4 : begin
         yyval := yyv[yysp-1];
       end;
   5 : begin
         AddDef(lastDef, yyv[yysp-0]); 
       end;
   6 : begin
         lastDef := lastIdent; 
       end;
   7 : begin
         yyval := yyv[yysp-1];
       end;
   8 : begin
         lastIdent := UTF8ToWideString(Lexer.yytext); 
       end;
   9 : begin
         yyval := yyv[yysp-0]; 
       end;
  10 : begin
         yyval := yyv[yysp-2] + yyv[yysp-0]; 
       end;
  11 : begin
         yyval := yyv[yysp-2] - yyv[yysp-0]; 
       end;
  12 : begin
         yyval := yyv[yysp-0]; 
       end;
  13 : begin
         yyval := yyv[yysp-2] * yyv[yysp-0]; 
       end;
  14 : begin
         yyval := yyv[yysp-2] div yyv[yysp-0]; 
       end;
  15 : begin
         yyval := yyv[yysp-0]; 
       end;
  16 : begin
         yyval := -yyv[yysp-0];
       end;
  17 : begin
         yyval := yyv[yysp-1]; 
       end;
  18 : begin
         yyval := lookupLastIdent; 
       end;
  19 : begin
         yyval := StrToInt(string(Lexer.yytext)); 
       end;
    end;
  except
    on E:Exception do
      yyerror('Exception: ' + E.Classname + ': ' + E.Message);
    //Expect parser stack to potentially be garbage and use object
    //trackers to clean up if need be./
  end;
end(*yyaction*);

(* parse table: *)

type YYARec = record
                sym, act : Integer;
              end;
     YYRRec = record
                len, sym : Integer;
              end;

const

yynacts   = 73;
yyngotos  = 42;
yynstates = 32;
yynrules  = 19;

yya : array [1..yynacts] of YYARec = (
{ 0: }
  ( sym: 257; act: 10 ),
  ( sym: 259; act: 11 ),
  ( sym: 262; act: 12 ),
  ( sym: 264; act: 13 ),
{ 1: }
{ 2: }
{ 3: }
  ( sym: 260; act: 14 ),
  ( sym: 261; act: 15 ),
  ( sym: 0; act: -9 ),
  ( sym: 258; act: -9 ),
  ( sym: 259; act: -9 ),
  ( sym: 263; act: -9 ),
  ( sym: 265; act: -9 ),
{ 4: }
  ( sym: 266; act: 16 ),
  ( sym: 0; act: -18 ),
  ( sym: 258; act: -18 ),
  ( sym: 259; act: -18 ),
  ( sym: 260; act: -18 ),
  ( sym: 261; act: -18 ),
{ 5: }
  ( sym: 257; act: 10 ),
  ( sym: 259; act: 11 ),
  ( sym: 262; act: 12 ),
  ( sym: 264; act: 13 ),
{ 6: }
{ 7: }
  ( sym: 258; act: 20 ),
  ( sym: 259; act: 21 ),
  ( sym: 0; act: -2 ),
{ 8: }
  ( sym: 257; act: 10 ),
  ( sym: 259; act: 11 ),
  ( sym: 262; act: 12 ),
  ( sym: 264; act: 13 ),
{ 9: }
  ( sym: 0; act: 0 ),
{ 10: }
{ 11: }
  ( sym: 257; act: 10 ),
{ 12: }
  ( sym: 257; act: 10 ),
  ( sym: 259; act: 11 ),
  ( sym: 262; act: 12 ),
  ( sym: 264; act: 13 ),
{ 13: }
{ 14: }
  ( sym: 257; act: 10 ),
  ( sym: 259; act: 11 ),
  ( sym: 262; act: 12 ),
  ( sym: 264; act: 13 ),
{ 15: }
  ( sym: 257; act: 10 ),
  ( sym: 259; act: 11 ),
  ( sym: 262; act: 12 ),
  ( sym: 264; act: 13 ),
{ 16: }
{ 17: }
{ 18: }
{ 19: }
  ( sym: 258; act: 20 ),
  ( sym: 259; act: 21 ),
  ( sym: 265; act: 28 ),
{ 20: }
  ( sym: 257; act: 10 ),
  ( sym: 259; act: 11 ),
  ( sym: 262; act: 12 ),
  ( sym: 264; act: 13 ),
{ 21: }
  ( sym: 257; act: 10 ),
  ( sym: 259; act: 11 ),
  ( sym: 262; act: 12 ),
  ( sym: 264; act: 13 ),
{ 22: }
{ 23: }
  ( sym: 258; act: 20 ),
  ( sym: 259; act: 21 ),
  ( sym: 0; act: -1 ),
{ 24: }
{ 25: }
  ( sym: 258; act: 20 ),
  ( sym: 259; act: 21 ),
  ( sym: 263; act: 31 ),
{ 26: }
{ 27: }
{ 28: }
{ 29: }
  ( sym: 260; act: 14 ),
  ( sym: 261; act: 15 ),
  ( sym: 0; act: -10 ),
  ( sym: 258; act: -10 ),
  ( sym: 259; act: -10 ),
  ( sym: 263; act: -10 ),
  ( sym: 265; act: -10 ),
{ 30: }
  ( sym: 260; act: 14 ),
  ( sym: 261; act: 15 ),
  ( sym: 0; act: -11 ),
  ( sym: 258; act: -11 ),
  ( sym: 259; act: -11 ),
  ( sym: 263; act: -11 ),
  ( sym: 265; act: -11 )
{ 31: }
);

yyg : array [1..yyngotos] of YYARec = (
{ 0: }
  ( sym: -11; act: 1 ),
  ( sym: -10; act: 2 ),
  ( sym: -9; act: 3 ),
  ( sym: -8; act: 4 ),
  ( sym: -6; act: 5 ),
  ( sym: -5; act: 6 ),
  ( sym: -4; act: 7 ),
  ( sym: -3; act: 8 ),
  ( sym: -2; act: 9 ),
{ 1: }
{ 2: }
{ 3: }
{ 4: }
{ 5: }
  ( sym: -11; act: 1 ),
  ( sym: -10; act: 2 ),
  ( sym: -9; act: 3 ),
  ( sym: -8; act: 17 ),
  ( sym: -7; act: 18 ),
  ( sym: -4; act: 19 ),
{ 6: }
{ 7: }
{ 8: }
  ( sym: -11; act: 1 ),
  ( sym: -10; act: 2 ),
  ( sym: -9; act: 3 ),
  ( sym: -8; act: 4 ),
  ( sym: -6; act: 5 ),
  ( sym: -5; act: 22 ),
  ( sym: -4; act: 23 ),
{ 9: }
{ 10: }
{ 11: }
  ( sym: -11; act: 24 ),
{ 12: }
  ( sym: -11; act: 1 ),
  ( sym: -10; act: 2 ),
  ( sym: -9; act: 3 ),
  ( sym: -8; act: 17 ),
  ( sym: -4; act: 25 ),
{ 13: }
{ 14: }
  ( sym: -11; act: 1 ),
  ( sym: -10; act: 26 ),
  ( sym: -8; act: 17 ),
{ 15: }
  ( sym: -11; act: 1 ),
  ( sym: -10; act: 27 ),
  ( sym: -8; act: 17 ),
{ 16: }
{ 17: }
{ 18: }
{ 19: }
{ 20: }
  ( sym: -11; act: 1 ),
  ( sym: -10; act: 2 ),
  ( sym: -9; act: 29 ),
  ( sym: -8; act: 17 ),
{ 21: }
  ( sym: -11; act: 1 ),
  ( sym: -10; act: 2 ),
  ( sym: -9; act: 30 ),
  ( sym: -8; act: 17 )
{ 22: }
{ 23: }
{ 24: }
{ 25: }
{ 26: }
{ 27: }
{ 28: }
{ 29: }
{ 30: }
{ 31: }
);

yyd : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } -15,
{ 2: } -12,
{ 3: } 0,
{ 4: } 0,
{ 5: } 0,
{ 6: } -3,
{ 7: } 0,
{ 8: } 0,
{ 9: } 0,
{ 10: } -19,
{ 11: } 0,
{ 12: } 0,
{ 13: } -8,
{ 14: } 0,
{ 15: } 0,
{ 16: } -6,
{ 17: } -18,
{ 18: } -5,
{ 19: } 0,
{ 20: } 0,
{ 21: } 0,
{ 22: } -4,
{ 23: } 0,
{ 24: } -16,
{ 25: } 0,
{ 26: } -13,
{ 27: } -14,
{ 28: } -7,
{ 29: } 0,
{ 30: } 0,
{ 31: } -17
);

yyal : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 5,
{ 2: } 5,
{ 3: } 5,
{ 4: } 12,
{ 5: } 18,
{ 6: } 22,
{ 7: } 22,
{ 8: } 25,
{ 9: } 29,
{ 10: } 30,
{ 11: } 30,
{ 12: } 31,
{ 13: } 35,
{ 14: } 35,
{ 15: } 39,
{ 16: } 43,
{ 17: } 43,
{ 18: } 43,
{ 19: } 43,
{ 20: } 46,
{ 21: } 50,
{ 22: } 54,
{ 23: } 54,
{ 24: } 57,
{ 25: } 57,
{ 26: } 60,
{ 27: } 60,
{ 28: } 60,
{ 29: } 60,
{ 30: } 67,
{ 31: } 74
);

yyah : array [0..yynstates-1] of Integer = (
{ 0: } 4,
{ 1: } 4,
{ 2: } 4,
{ 3: } 11,
{ 4: } 17,
{ 5: } 21,
{ 6: } 21,
{ 7: } 24,
{ 8: } 28,
{ 9: } 29,
{ 10: } 29,
{ 11: } 30,
{ 12: } 34,
{ 13: } 34,
{ 14: } 38,
{ 15: } 42,
{ 16: } 42,
{ 17: } 42,
{ 18: } 42,
{ 19: } 45,
{ 20: } 49,
{ 21: } 53,
{ 22: } 53,
{ 23: } 56,
{ 24: } 56,
{ 25: } 59,
{ 26: } 59,
{ 27: } 59,
{ 28: } 59,
{ 29: } 66,
{ 30: } 73,
{ 31: } 73
);

yygl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 10,
{ 2: } 10,
{ 3: } 10,
{ 4: } 10,
{ 5: } 10,
{ 6: } 16,
{ 7: } 16,
{ 8: } 16,
{ 9: } 23,
{ 10: } 23,
{ 11: } 23,
{ 12: } 24,
{ 13: } 29,
{ 14: } 29,
{ 15: } 32,
{ 16: } 35,
{ 17: } 35,
{ 18: } 35,
{ 19: } 35,
{ 20: } 35,
{ 21: } 39,
{ 22: } 43,
{ 23: } 43,
{ 24: } 43,
{ 25: } 43,
{ 26: } 43,
{ 27: } 43,
{ 28: } 43,
{ 29: } 43,
{ 30: } 43,
{ 31: } 43
);

yygh : array [0..yynstates-1] of Integer = (
{ 0: } 9,
{ 1: } 9,
{ 2: } 9,
{ 3: } 9,
{ 4: } 9,
{ 5: } 15,
{ 6: } 15,
{ 7: } 15,
{ 8: } 22,
{ 9: } 22,
{ 10: } 22,
{ 11: } 23,
{ 12: } 28,
{ 13: } 28,
{ 14: } 31,
{ 15: } 34,
{ 16: } 34,
{ 17: } 34,
{ 18: } 34,
{ 19: } 34,
{ 20: } 38,
{ 21: } 42,
{ 22: } 42,
{ 23: } 42,
{ 24: } 42,
{ 25: } 42,
{ 26: } 42,
{ 27: } 42,
{ 28: } 42,
{ 29: } 42,
{ 30: } 42,
{ 31: } 42
);

yyr : array [1..yynrules] of YYRRec = (
{ 1: } ( len: 2; sym: -2 ),
{ 2: } ( len: 1; sym: -2 ),
{ 3: } ( len: 1; sym: -3 ),
{ 4: } ( len: 2; sym: -3 ),
{ 5: } ( len: 2; sym: -5 ),
{ 6: } ( len: 2; sym: -6 ),
{ 7: } ( len: 2; sym: -7 ),
{ 8: } ( len: 1; sym: -8 ),
{ 9: } ( len: 1; sym: -4 ),
{ 10: } ( len: 3; sym: -4 ),
{ 11: } ( len: 3; sym: -4 ),
{ 12: } ( len: 1; sym: -9 ),
{ 13: } ( len: 3; sym: -9 ),
{ 14: } ( len: 3; sym: -9 ),
{ 15: } ( len: 1; sym: -10 ),
{ 16: } ( len: 2; sym: -10 ),
{ 17: } ( len: 3; sym: -10 ),
{ 18: } ( len: 1; sym: -10 ),
{ 19: } ( len: 1; sym: -11 )
);


const _error = 256; (* error token *)

function yyact(state, sym : Integer; var act : Integer) : Boolean;
  (* search action table *)
  var k : Integer;
  begin
    k := yyal[state];
    while (k<=yyah[state]) and (yya[k].sym<>sym) do inc(k);
    if k>yyah[state] then
      yyact := false
    else
      begin
        act := yya[k].act;
        yyact := true;
      end;
  end(*yyact*);

function yygoto(state, sym : Integer; var nstate : Integer) : Boolean;
  (* search goto table *)
  var k : Integer;
  begin
    k := yygl[state];
    while (k<=yygh[state]) and (yyg[k].sym<>sym) do inc(k);
    if k>yygh[state] then
      yygoto := false
    else
      begin
        nstate := yyg[k].act;
        yygoto := true;
      end;
  end(*yygoto*);

label parse, next, error, errlab, shift, reduce, accept, abort;

begin(*yyparse*)

  (* initialize: *)

  yystate := 0; yychar := -1; yynerrs := 0; yyerrflag := 0; yysp := 0;

{$ifdef yydebug}
  yydebug := true;
{$else}
  yydebug := false;
{$endif}

parse:

  (* push state and value: *)

  inc(yysp);
  if yysp>yymaxdepth then
    begin
      yyerror('yyparse stack overflow');
      goto abort;
    end;
  yys[yysp] := yystate; yyv[yysp] := yyval;

next:

  if (yyd[yystate]=0) and (yychar=-1) then
    (* get next symbol *)
    begin
      yychar := Lexer.yylex; if yychar<0 then yychar := 0;
    end;

  if yydebug then Lexer.YYOutWriteLn('state ' + IntTostr(yystate) + ', char ' + IntToStr(yychar));

  (* determine parse action: *)

  yyn := yyd[yystate];
  if yyn<>0 then goto reduce; (* simple state *)

  (* no default action; search parse table *)

  if not yyact(yystate, yychar, yyn) then goto error
  else if yyn>0 then                      goto shift
  else if yyn<0 then                      goto reduce
  else                                    goto accept;

error:

  (* error; start error recovery: *)

  if yyerrflag=0 then yyerror('syntax error');

errlab:

  if yyerrflag=0 then inc(yynerrs);     (* new error *)

  if yyerrflag<=2 then                  (* incomplete recovery; try again *)
    begin
      yyerrflag := 3;
      (* uncover a state with shift action on error token *)
      while (yysp>0) and not ( yyact(yys[yysp], _error, yyn) and
                               (yyn>0) ) do
        begin
          if yydebug then
            if yysp>1 then
              Lexer.YYOutWriteLn('error recovery pops state ' + IntToStr(yys[yysp]) +
                                 ', uncovers ' + IntToStr(yys[yysp-1]))
            else
              Lexer.YYOutWriteLn('error recovery fails ... abort');
          dec(yysp);
        end;
      if yysp=0 then goto abort; (* parser has fallen from stack; abort *)
      yystate := yyn;            (* simulate shift on error *)
      goto parse;
    end
  else                                  (* no shift yet; discard symbol *)
    begin
      if yydebug then Lexer.YYOutWriteLn('error recovery discards char ' + IntToStr(yychar));
      if yychar=0 then goto abort; (* end of input; abort *)
      yychar := -1; goto next;     (* clear lookahead char and try again *)
    end;

shift:

  (* go to new state, clear lookahead character: *)

  yystate := yyn; yychar := -1; yyval := yylval;
  if yyerrflag>0 then dec(yyerrflag);

  goto parse;

reduce:

  (* execute action, pop rule from stack, and go to next state: *)

  if yydebug then Lexer.YYOutWriteLn('reduce ' + InttoStr(-yyn));

  yyflag := yyfnone; yyaction(-yyn);
  dec(yysp, yyr[-yyn].len);
  if yygoto(yys[yysp], yyr[-yyn].sym, yyn) then yystate := yyn;

  (* handle action calls to yyaccept, yyabort and yyerror: *)

  case yyflag of
    yyfaccept : goto accept;
    yyfabort  : goto abort;
    yyferror  : goto errlab;
  end;

  goto parse;

accept:

  yyparse := 0; exit;

abort:

  yyparse := 1; exit;

end(*yyparse*);


procedure TCalcParser.AddDef(ident:string; val: integer);
begin
  if IdentList.IndexOf(ident) >= 0 then
  begin
        yyerror('Identifier already defined: ' + lastIdent);
        yyerrlab;
  end
  else
        IdentList.AddObject(ident, Pointer(val));
end;

function TCalcParser.lookupLastIdent: integer;
var
  Idx: integer;
begin
  Idx := IdentList.IndexOf(lastIdent);
  if Idx < 0 then
  begin
        yyerror('Identifier not defined: ' + lastIdent);
        result := 0;
        yyerrlab;
  end
  else
    result := Integer(IdentList.Objects[Idx]);
end;

constructor TCalcParser.Create;
begin
  inherited;
  IdentList := TStringList.Create;
  Lexer := TCalcLexer.Create;
end;

destructor TCalcParser.Destroy;
begin
  Lexer.Free;
  IdentList.Free;
  inherited;
end;

procedure TCalcParser.yyerror ( msg : String );
var
  Debug: TStringList;
  i: integer;
begin
  inherited;
  Debug := GetStateDebug(yystate);
  if Assigned(Debug) then
  begin
    Lexer.YYOutWriteLn('Parser state debug: ');
    for i := 0 to Pred(Debug.Count) do
      Lexer.YYOutWriteLn(Debug[i]);
    Debug.Free;
  end;
end;

procedure TCalcParser.yyaction_debug(State: integer; Action: integer);
var
  S: string;
begin
  if not (yydebug or yyactiondebug) then exit;
  inherited;
  S := GetStateActionString(State, Action);
  if Length(S) > 0 then
    Lexer.YYOutWriteLn(S);
end;

end.
