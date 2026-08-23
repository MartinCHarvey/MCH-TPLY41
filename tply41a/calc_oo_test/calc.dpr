program calc;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes,
  calc_oo_parse in 'calc_oo_parse.pas',
  calc_oo_lex in 'calc_oo_lex.pas',
  yacclib_oo in '..\lib_oo\yacclib_oo.pas',
  lexlib_oo in '..\lib_oo\lexlib_oo.pas',
  IoUtils,
  Trackables in '..\..\..\..\Delphi XE Progs\Common\Tracking\Trackables.pas',
  BinaryTree in '..\..\..\..\Delphi XE Progs\Common\Balanced Tree\BinaryTree.pas',
  calc_oo_parse_debug in 'calc_oo_parse_debug.pas';

var
  StrInput: string;
  Tmp: Text;
  TmpName, TmpOutName: string;
  PResult: integer;
  Parser: TCalcParser;
  More: boolean;

begin
  try
    Parser := TCalcParser.Create;
    Parser.yyactiondebug := true;
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

      Parser.Lexer.yyinput := TFileStream.Create(TmpName, fmOpenRead);
      Parser.Lexer.yyoutput := TFileStream.Create(TmpOutName, fmCreate);
      PResult := Parser.yyparse;
      if (PResult = 0) then
      begin
        WriteLn('Parsed expression OK.');
        WriteLn('Result : ' + IntToStr(Parser.yyp_result));
      end
      else
      begin
        WriteLn('Expression or parse bad:');
      end;
      Parser.Lexer.yyoutput.Seek(0, soFromBeginning);
      repeat
        More := Parser.Lexer.YYOutReadLn(StrInput);
        WriteLn(StrInput);
      until not More;
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
