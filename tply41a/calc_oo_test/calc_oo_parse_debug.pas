unit calc_oo_parse_debug;

interface

uses SysUtils, Classes;

function GetStateDebug(state: integer):TStringList;
function GetStateActionString(State: integer; Action:Integer): string;

implementation

const
  ListInfo: array [0..332] of string = (
    '',
    'state 0:',
    '',
    '	$accept : _ calc_result $end',
    '',
    '	_number	shift 10',
    '	_minus	shift 11',
    '	_lparen	shift 12',
    '	_ident	shift 13',
    '	.	error',
    '',
    '	number	goto 1',
    '	calc_unary_expr	goto 2',
    '	calc_mul_expr	goto 3',
    '	ident	goto 4',
    '	calc_def_left	goto 5',
    '	calc_definition	goto 6',
    '	calc_expression	goto 7',
    '	calc_definitions	goto 8',
    '	calc_result	goto 9',
    '',
    'state 1:',
    '',
    '	calc_unary_expr : number _	(15)',
    '',
    '	.	reduce 15',
    '',
    'state 2:',
    '',
    '	calc_mul_expr : calc_unary_expr _	(12)',
    '',
    '	.	reduce 12',
    '',
    'state 3:',
    '',
    '	calc_expression : calc_mul_expr _	(9)',
    '	calc_mul_expr : calc_mul_expr _ _mul calc_unary_expr',
    '	calc_mul_expr : calc_mul_expr _ _div calc_unary_expr',
    '',
    '	_mul	shift 14',
    '	_div	shift 15',
    '	$end	reduce 9',
    '	_plus	reduce 9',
    '	_minus	reduce 9',
    '	_rparen	reduce 9',
    '	_semi	reduce 9',
    '	.	error',
    '',
    'state 4:',
    '',
    '	calc_def_left : ident _ _eq',
    '	calc_unary_expr : ident _	(18)',
    '',
    '	_eq	shift 16',
    '	$end	reduce 18',
    '	_plus	reduce 18',
    '	_minus	reduce 18',
    '	_mul	reduce 18',
    '	_div	reduce 18',
    '	.	error',
    '',
    'state 5:',
    '',
    '	calc_definition : calc_def_left _ calc_def_right',
    '',
    '	_number	shift 10',
    '	_minus	shift 11',
    '	_lparen	shift 12',
    '	_ident	shift 13',
    '	.	error',
    '',
    '	number	goto 1',
    '	calc_unary_expr	goto 2',
    '	calc_mul_expr	goto 3',
    '	ident	goto 17',
    '	calc_def_right	goto 18',
    '	calc_expression	goto 19',
    '',
    'state 6:',
    '',
    '	calc_definitions : calc_definition _	(3)',
    '',
    '	.	reduce 3',
    '',
    'state 7:',
    '',
    '	calc_result : calc_expression _	(2)',
    '	calc_expression : calc_expression _ _plus calc_mul_expr',
    '	calc_expression : calc_expression _ _minus calc_mul_expr',
    '',
    '	_plus	shift 20',
    '	_minus	shift 21',
    '	$end	reduce 2',
    '	.	error',
    '',
    'state 8:',
    '',
    '	calc_result : calc_definitions _ calc_expression',
    '	calc_definitions : calc_definitions _ calc_definition',
    '',
    '	_number	shift 10',
    '	_minus	shift 11',
    '	_lparen	shift 12',
    '	_ident	shift 13',
    '	.	error',
    '',
    '	number	goto 1',
    '	calc_unary_expr	goto 2',
    '	calc_mul_expr	goto 3',
    '	ident	goto 4',
    '	calc_def_left	goto 5',
    '	calc_definition	goto 22',
    '	calc_expression	goto 23',
    '',
    'state 9:',
    '',
    '	$accept : calc_result _ $end',
    '',
    '	$end	accept',
    '	.	error',
    '',
    'state 10:',
    '',
    '	number : _number _	(19)',
    '',
    '	.	reduce 19',
    '',
    'state 11:',
    '',
    '	calc_unary_expr : _minus _ number',
    '',
    '	_number	shift 10',
    '	.	error',
    '',
    '	number	goto 24',
    '',
    'state 12:',
    '',
    '	calc_unary_expr : _lparen _ calc_expression _rparen',
    '',
    '	_number	shift 10',
    '	_minus	shift 11',
    '	_lparen	shift 12',
    '	_ident	shift 13',
    '	.	error',
    '',
    '	number	goto 1',
    '	calc_unary_expr	goto 2',
    '	calc_mul_expr	goto 3',
    '	ident	goto 17',
    '	calc_expression	goto 25',
    '',
    'state 13:',
    '',
    '	ident : _ident _	(8)',
    '',
    '	.	reduce 8',
    '',
    'state 14:',
    '',
    '	calc_mul_expr : calc_mul_expr _mul _ calc_unary_expr',
    '',
    '	_number	shift 10',
    '	_minus	shift 11',
    '	_lparen	shift 12',
    '	_ident	shift 13',
    '	.	error',
    '',
    '	number	goto 1',
    '	calc_unary_expr	goto 26',
    '	ident	goto 17',
    '',
    'state 15:',
    '',
    '	calc_mul_expr : calc_mul_expr _div _ calc_unary_expr',
    '',
    '	_number	shift 10',
    '	_minus	shift 11',
    '	_lparen	shift 12',
    '	_ident	shift 13',
    '	.	error',
    '',
    '	number	goto 1',
    '	calc_unary_expr	goto 27',
    '	ident	goto 17',
    '',
    'state 16:',
    '',
    '	calc_def_left : ident _eq _	(6)',
    '',
    '	.	reduce 6',
    '',
    'state 17:',
    '',
    '	calc_unary_expr : ident _	(18)',
    '',
    '	.	reduce 18',
    '',
    'state 18:',
    '',
    '	calc_definition : calc_def_left calc_def_right _	(5)',
    '',
    '	.	reduce 5',
    '',
    'state 19:',
    '',
    '	calc_def_right : calc_expression _ _semi',
    '	calc_expression : calc_expression _ _plus calc_mul_expr',
    '	calc_expression : calc_expression _ _minus calc_mul_expr',
    '',
    '	_plus	shift 20',
    '	_minus	shift 21',
    '	_semi	shift 28',
    '	.	error',
    '',
    'state 20:',
    '',
    '	calc_expression : calc_expression _plus _ calc_mul_expr',
    '',
    '	_number	shift 10',
    '	_minus	shift 11',
    '	_lparen	shift 12',
    '	_ident	shift 13',
    '	.	error',
    '',
    '	number	goto 1',
    '	calc_unary_expr	goto 2',
    '	calc_mul_expr	goto 29',
    '	ident	goto 17',
    '',
    'state 21:',
    '',
    '	calc_expression : calc_expression _minus _ calc_mul_expr',
    '',
    '	_number	shift 10',
    '	_minus	shift 11',
    '	_lparen	shift 12',
    '	_ident	shift 13',
    '	.	error',
    '',
    '	number	goto 1',
    '	calc_unary_expr	goto 2',
    '	calc_mul_expr	goto 30',
    '	ident	goto 17',
    '',
    'state 22:',
    '',
    '	calc_definitions : calc_definitions calc_definition _	(4)',
    '',
    '	.	reduce 4',
    '',
    'state 23:',
    '',
    '	calc_result : calc_definitions calc_expression _	(1)',
    '	calc_expression : calc_expression _ _plus calc_mul_expr',
    '	calc_expression : calc_expression _ _minus calc_mul_expr',
    '',
    '	_plus	shift 20',
    '	_minus	shift 21',
    '	$end	reduce 1',
    '	.	error',
    '',
    'state 24:',
    '',
    '	calc_unary_expr : _minus number _	(16)',
    '',
    '	.	reduce 16',
    '',
    'state 25:',
    '',
    '	calc_unary_expr : _lparen calc_expression _ _rparen',
    '	calc_expression : calc_expression _ _plus calc_mul_expr',
    '	calc_expression : calc_expression _ _minus calc_mul_expr',
    '',
    '	_plus	shift 20',
    '	_minus	shift 21',
    '	_rparen	shift 31',
    '	.	error',
    '',
    'state 26:',
    '',
    '	calc_mul_expr : calc_mul_expr _mul calc_unary_expr _	(13)',
    '',
    '	.	reduce 13',
    '',
    'state 27:',
    '',
    '	calc_mul_expr : calc_mul_expr _div calc_unary_expr _	(14)',
    '',
    '	.	reduce 14',
    '',
    'state 28:',
    '',
    '	calc_def_right : calc_expression _semi _	(7)',
    '',
    '	.	reduce 7',
    '',
    'state 29:',
    '',
    '	calc_expression : calc_expression _plus calc_mul_expr _	(10)',
    '	calc_mul_expr : calc_mul_expr _ _mul calc_unary_expr',
    '	calc_mul_expr : calc_mul_expr _ _div calc_unary_expr',
    '',
    '	_mul	shift 14',
    '	_div	shift 15',
    '	$end	reduce 10',
    '	_plus	reduce 10',
    '	_minus	reduce 10',
    '	_rparen	reduce 10',
    '	_semi	reduce 10',
    '	.	error',
    '',
    'state 30:',
    '',
    '	calc_expression : calc_expression _minus calc_mul_expr _	(11)',
    '	calc_mul_expr : calc_mul_expr _ _mul calc_unary_expr',
    '	calc_mul_expr : calc_mul_expr _ _div calc_unary_expr',
    '',
    '	_mul	shift 14',
    '	_div	shift 15',
    '	$end	reduce 11',
    '	_plus	reduce 11',
    '	_minus	reduce 11',
    '	_rparen	reduce 11',
    '	_semi	reduce 11',
    '	.	error',
    '',
    'state 31:',
    '',
    '	calc_unary_expr : _lparen calc_expression _rparen _	(17)',
    '',
    '	.	reduce 17',
    '');

function LookupOffsets(State: integer; var First: integer;var Last: integer): boolean;
begin
  result := true;
  case State of
    0: begin
      First := 1;
      Last := 20;
    end;
    1: begin
      First := 21;
      Last := 26;
    end;
    2: begin
      First := 27;
      Last := 32;
    end;
    3: begin
      First := 33;
      Last := 47;
    end;
    4: begin
      First := 48;
      Last := 60;
    end;
    5: begin
      First := 61;
      Last := 77;
    end;
    6: begin
      First := 78;
      Last := 83;
    end;
    7: begin
      First := 84;
      Last := 94;
    end;
    8: begin
      First := 95;
      Last := 113;
    end;
    9: begin
      First := 114;
      Last := 120;
    end;
    10: begin
      First := 121;
      Last := 126;
    end;
    11: begin
      First := 127;
      Last := 135;
    end;
    12: begin
      First := 136;
      Last := 151;
    end;
    13: begin
      First := 152;
      Last := 157;
    end;
    14: begin
      First := 158;
      Last := 171;
    end;
    15: begin
      First := 172;
      Last := 185;
    end;
    16: begin
      First := 186;
      Last := 191;
    end;
    17: begin
      First := 192;
      Last := 197;
    end;
    18: begin
      First := 198;
      Last := 203;
    end;
    19: begin
      First := 204;
      Last := 214;
    end;
    20: begin
      First := 215;
      Last := 229;
    end;
    21: begin
      First := 230;
      Last := 244;
    end;
    22: begin
      First := 245;
      Last := 250;
    end;
    23: begin
      First := 251;
      Last := 261;
    end;
    24: begin
      First := 262;
      Last := 267;
    end;
    25: begin
      First := 268;
      Last := 278;
    end;
    26: begin
      First := 279;
      Last := 284;
    end;
    27: begin
      First := 285;
      Last := 290;
    end;
    28: begin
      First := 291;
      Last := 296;
    end;
    29: begin
      First := 297;
      Last := 311;
    end;
    30: begin
      First := 312;
      Last := 326;
    end;
    31: begin
      First := 327;
      Last := 332;
    end;
  else
    First := -1; Last := -1;
    result := false;
  end;
end;

function GetStateDebug(state: integer):TStringList;
var
  First, Last, i: integer;
begin
  if LookupOffsets(state, First, Last) then
  begin
    result := TStringList.Create;
    Assert(Last >= First);
    for i := First to Last do
      result.Add(ListInfo[i]);
  end
  else
    result := nil;
end;

function GetStateActionString(State: integer; Action:Integer): string;
var
  StateStrs: TStringList;
  ActionMatch: string;
  StatePos, ColonPos, i: integer;
begin
  StateStrs := GetStateDebug(State);
  try
    if Assigned(StateStrs) then
    begin
      ActionMatch := '(' + IntToStr(Action) + ')';
      for i := 0 to Pred(StateStrs.Count) do
      begin
        StatePos := Pos(ActionMatch, StateStrs[i]);
        ColonPos := Pos(':', StateStrs[i]);
        if (StatePos > 0) and (ColonPos > 0) and (StatePos > ColonPos) then
        begin
          result := Trim(StateStrs[i]);
          exit;
        end;
      end;
    end;
  finally
    StateStrs.Free;
  end;
  SetLength(result, 0)
end;
end.

