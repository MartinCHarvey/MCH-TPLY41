program calc;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  calc_oo_parse in 'calc_oo_parse.pas',
  calc_oo_lex in 'calc_oo_lex.pas',
  yacclib_oo in '..\lib_oo\yacclib_oo.pas',
  lexlib_oo in '..\lib_oo\lexlib_oo.pas',
  lexdstr in '..\lexdstr.pas',
  IoUtils,
  Trackables in '..\..\..\..\Delphi XE Progs\Common\Tracking\Trackables.pas',
  BinaryTree in '..\..\..\..\Delphi XE Progs\Common\Balanced Tree\BinaryTree.pas';

var
  StrInput: string;
  Tmp: Text;
  TmpName, TmpOutName: string;
  PResult: integer;
  Parser: TCalcParser;

begin
  try
    Parser := TCalcParser.Create;
    try
      { TODO -oUser -cConsole Main : Insert code here }
      TmpName := IOUtils.TPath.GetTempFileName;
      TmpOutName := IOUtils.TPath.GetTempFileName;
      Assign(Tmp, TmpName);
      Rewrite(Tmp);

      WriteLn('Type optional definitions terminated with semicolon, and an expression');
      WriteLn('End with a blank line.');
      WriteLn('eg: foo = 1;');
      WriteLn('eg: bar = 1;');
      WriteLn('eg: foo + bar');
      repeat
        ReadLn(StrInput);
        WriteLn(Tmp, StrInput);
      until Length(StrInput) = 0;

      Close(Tmp);

      Assign(Parser.Lexer.yyinput, TmpName);
      Reset(Parser.Lexer.yyInput);
      Assign(Parser.Lexer.yyoutput, TmpOutName);
      Rewrite(Parser.Lexer.yyOutput);
      PResult := Parser.yyparse;
      if (PResult = 0) then
      begin
        WriteLn('Parsed expression OK.');
        WriteLn('Result : ' + IntToStr(Parser.yyp_result));
      end
      else
      begin
        WriteLn('Expression or parse bad:');
        Reset(Parser.Lexer.yyoutput);
        repeat
          ReadLn(Parser.Lexer.yyoutput, StrInput);
          WriteLn(StrInput);
        until Eof(Parser.Lexer.yyoutput);
        Close(Parser.Lexer.yyoutput);
      end;
      DeleteFile(TmpName);
      DeleteFile(TmpOutName);
    finally
      Parser.Free;
    end;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
