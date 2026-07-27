
%{

unit
  calc_oo_parse;

interface

uses
  calc_oo_lex, lexlib_oo, yacclib_oo, SysUtils, Classes;

%}


%classname TCalcParser
%classvar  yyp_result: integer;
%classvar  lastIdent, lastDef: string;
%classvar  identList: TStringList;
%classvar  Lexer: TCalcLexer;

%classfunc  procedure AddDef(ident:string; val: integer);
%classfunc  function lookupLastIdent: integer;
%classfunc  constructor Create;
%classfunc  destructor Destroy; override;

%token
        _number
        _plus
        _minus
        _mul
        _div
        _lparen
        _rparen
        _ident
        _semi
        _eq

%start
        calc_result

%%

calc_result     :
                calc_definitions calc_expression        { yyp_result := $2; }
        |       calc_expression                         { yyp_result := $1; }
        ;

calc_definitions :
                calc_definition
        |       calc_definitions calc_definition
        ;

calc_definition :
                calc_def_left calc_def_right            { AddDef(lastDef, $2); }
        ;

calc_def_left   :
                ident _eq                               { lastDef := lastIdent; }
        ;

calc_def_right  :
                calc_expression  _semi                  /* $$ = $1 */
        ;

ident           :
                _ident                                  { lastIdent := Lexer.yytoken_text; }
        ;

calc_expression :
                calc_mul_expr                           { $$ := $1; }
        |       calc_expression _plus calc_mul_expr     { $$ := $1 + $3; }
        |       calc_expression _minus calc_mul_expr    { $$ := $1 - $3; }
        ;

calc_mul_expr :
                calc_unary_expr                         { $$ := $1; }
        |       calc_mul_expr _mul calc_unary_expr      { $$ := $1 * $3; }
        |       calc_mul_expr _div calc_unary_expr      { $$ := $1 div $3; }

calc_unary_expr :
                number                          { $$ := $1; }
        |       _minus number                   { $$ := -$2;}
        |       _lparen calc_expression _rparen { $$ := $2; }
        |       ident                           { $$ := lookupLastIdent; }
        ;

number          :
                _number         { $$ := StrToInt(string(Lexer.yytoken_text)); }
        ;

%%

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
  //TODO - Init / reset?
end;

destructor TCalcParser.Destroy;
begin
  Lexer.Free;
  IdentList.Free;
  inherited;
end;

end.

