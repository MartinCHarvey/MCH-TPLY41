
{$I-}

unit YaccLib_oo;

(* Yacc Library Unit for TP Yacc Version 3.0, 6-17-91 AG *)

interface

uses
{$IFDEF USE_TRACKABLES}
  Trackables,
{$ENDIF}
  lexlib_oo;

const yymaxdepth = 1024;
  (* default stack size of parser *)


type
  YYSType = Integer;
  (* default value type, may be redefined in Yacc output file *)

{$IFDEF USE_TRACKABLES}
  TPLYParser = class(TTrackable)
{$ELSE}
  TPLYParser = class
{$ENDIF}
  private
    FLexer: TPLYLexer;
  protected
    yyflag    : ( yyfnone, yyfaccept, yyfabort, yyferror );
    yyerrflag : Integer;
  public
    yychar   : Integer; (* current lookahead character *)
    yynerrs  : Integer; (* current number of syntax errors reported by the
                           parser *)
    yydebug  : Boolean; (* set to true to enable debugging output of parser *)

    procedure yyerror ( msg : String ); virtual;
      (* error message printing routine used by the parser *)

    procedure yyclearin;
      (* delete the current lookahead token *)

    procedure yyaccept;
      (* trigger accept action of the parser; yyparse accepts returning 0, as if
         it reached end of input *)

    procedure yyabort;
      (* like yyaccept, but causes parser to return with value 1, as if an
         unrecoverable syntax error had been encountered *)

    procedure yyerrlab;
      (* causes error recovery to be started, as if a syntax error had been
         encountered *)

    procedure yyerrok;
      (* when in error mode, resets the parser to its normal mode of
         operation *)

    property Lexer: TPLYLexer read FLexer write FLexer;
  end;

implementation

uses
  SysUtils;

const
  CR_LF = #13 + #10;

procedure TPLYParser.yyerror ( msg : String );
  begin
    Lexer.YYOutWriteLn(msg);
    //Could encounter error *after* yywrap, so streams left open.
    Lexer.YYOutWriteLn( ' Line: ' + IntToStr(Lexer.yytokenlineno) + CR_LF +
                        ' Col: ' + IntToStr(Lexer.yytokencolno) + CR_LF +
                        ' Token: ''' + Lexer.yytoken_text + '''' + CR_LF +
                        ' PrevLine: ' + IntToStr(Lexer.yyprevtokenlineno) + CR_LF +
                        ' PrevCol: ' + IntToStr(Lexer.yyprevtokencolno) + CR_LF +
                        ' PrevToken: ''' + Lexer.yyprevtoken_text + '''' + CR_LF);
  end(*yyerrmsg*);

procedure TPLYParser.yyclearin;
  begin
    yychar := -1;
  end(*yyclearin*);

procedure TPLYParser.yyaccept;
  begin
    yyflag := yyfaccept;
  end(*yyaccept*);

procedure TPLYParser.yyabort;
  begin
    yyflag := yyfabort;
  end(*yyabort*);

procedure TPLYParser.yyerrlab;
  begin
    yyflag := yyferror;
  end(*yyerrlab*);

procedure TPLYParser.yyerrok;
  begin
    yyerrflag := 0;
  end(*yyerrork*);

end(*YaccLib*).
