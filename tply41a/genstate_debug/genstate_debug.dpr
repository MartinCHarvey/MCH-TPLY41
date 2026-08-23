program genstate_debug;

{

  Copyright © 2026 Martin Harvey <martin_c_harvey@hotmail.com>

  Permission is hereby granted, free of charge, to any person obtaining a copy of
  this software and associated documentation files (the “Software”), to deal in
  the Software without restriction, including without limitation the rights to
  use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
  of the Software, and to permit persons to whom the Software is furnished to do
  so, subject to the following conditions:

  The above copyright notice and this permission notice shall be included in
  all copies or substantial portions of the Software.

  THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
  IN THE SOFTWARE.

}

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Classes;

type
  TStateRef = class
    StateNumber: integer;
    FirstLine: integer;
    LastLine: integer;
  end;

var
  ListName, OutName, OutUnitName: string;
  OutFile: Text;
  Listing: TStringList;
  StateDebugs: TList;
  i: integer;

function GenOutput: boolean;
var
  i: integer;
  LStr: string;
  Ref: TStateRef;
begin
  WriteLn(OutFile, 'unit ', OutUnitName, ';');
  WriteLn(OutFile);
  WriteLn(OutFile, 'interface');
  WriteLn(OutFile);
  WriteLn(OutFile, 'uses SysUtils, Classes;');
  WriteLn(OutFile);
  WriteLn(OutFile, 'function GetStateDebug(state: integer):TStringList;');
  WriteLn(OutFile, 'function GetStateActionString(State: integer; Action:Integer): string;');
  WriteLn(OutFile);
  WriteLn(OutFile, 'implementation');
  WriteLn(OutFile);
  WriteLn(OutFile, 'const');
  WriteLn(OutFile, '  ListInfo: array [0..'+ IntToStr(Pred(Listing.Count)) + '] of string = (');
  for i := 0 to Pred(Listing.Count) do
  begin
    LStr := Listing[i].Replace('''', '''''');
    Write(OutFile, '    ''' + LStr + '''');
    if i = Pred(Listing.Count) then
      WriteLn(OutFile, ');')
    else
      WriteLn(OutFile, ',');
  end;
  WriteLn(OutFile);
  WriteLn(OutFile, 'function LookupOffsets(State: integer; var First: integer;var Last: integer): boolean;');
  WriteLn(OutFile, 'begin');
  WriteLn(OutFile, '  result := true;');
  WriteLn(OutFile, '  case State of');
  for i := 0 to Pred(StateDebugs.Count) do
  begin
    Ref := TStateRef(StateDebugs[i]);
    WriteLn(OutFile, '    ' + IntToStr (Ref.StateNumber) + ': begin');
    WriteLn(OutFile, '      First := ' + IntToStr(Ref.FirstLine) +';');
    WriteLn(OutFile, '      Last := ' + IntToStr(Ref.LastLine) +';');
    WriteLn(OutFile, '    end;');
  end;
  WriteLn(OutFile, '  else');
  WriteLn(OutFile, '    First := -1; Last := -1;');
  WriteLn(OutFile, '    result := false;');
  WriteLn(OutFile, '  end;');
  WriteLn(OutFile, 'end;');
  WriteLn(OutFile);
  WriteLn(OutFile, 'function GetStateDebug(state: integer):TStringList;');
  WriteLn(OutFile, 'var');
  WriteLn(OutFile, '  First, Last, i: integer;');
  WriteLn(OutFile, 'begin');
  WriteLn(OutFile, '  if LookupOffsets(state, First, Last) then');
  WriteLn(OutFile, '  begin');
  WriteLn(OutFile, '    result := TStringList.Create;');
  WriteLn(OutFile, '    Assert(Last >= First);');
  WriteLn(OutFile, '    for i := First to Last do');
  WriteLn(OutFile, '      result.Add(ListInfo[i]);');
  WriteLn(OutFile, '  end');
  WriteLn(OutFile, '  else');
  WriteLn(OutFile, '    result := nil;');
  WriteLn(OutFile, 'end;');
  WriteLn(OutFile);
  WriteLn(OutFile, 'function GetStateActionString(State: integer; Action:Integer): string;');
  WriteLn(OutFile, 'var');
  WriteLn(OutFile, '  StateStrs: TStringList;');
  WriteLn(OutFile, '  ActionMatch: string;');
  WriteLn(OutFile, '  StatePos, ColonPos, i: integer;');
  WriteLn(OutFile, 'begin');
  WriteLn(OutFile, '  StateStrs := GetStateDebug(State);');
  WriteLn(OutFile, '  try');
  WriteLn(OutFile, '    if Assigned(StateStrs) then');
  WriteLn(OutFile, '    begin');
  WriteLn(OutFile, '      ActionMatch := ''('' + IntToStr(Action) + '')'';');
  WriteLn(OutFile, '      for i := 0 to Pred(StateStrs.Count) do');
  WriteLn(OutFile, '      begin');
  WriteLn(OutFile, '        StatePos := Pos(ActionMatch, StateStrs[i]);');
  WriteLn(OutFile, '        ColonPos := Pos('':'', StateStrs[i]);');
  WriteLn(OutFile, '        if (StatePos > 0) and (ColonPos > 0) and (StatePos > ColonPos) then');
  WriteLn(OutFile, '        begin');
  WriteLn(OutFile, '          result := Trim(StateStrs[i]);');
  WriteLn(OutFile, '          exit;');
  WriteLn(OutFile, '        end;');
  WriteLn(OutFile, '      end;');
  WriteLn(OutFile, '    end;');
  WriteLn(OutFile, '  finally');
  WriteLn(OutFile, '    StateStrs.Free;');
  WriteLn(OutFile, '  end;');
  WriteLn(OutFile, '  SetLength(result, 0)');
  WriteLn(OutFile, 'end;');

  WriteLn(OutFile, 'end.');
  WriteLn(OutFile);
  result := true;
end;

function StateDebugsSort(Item1, Item2: Pointer): Integer;
begin
  result := TStateRef(Item1).StateNumber - TStateRef(Item2).StateNumber;
end;

function CheckStateDebugs: boolean;
var
  i: integer;
begin
  if StateDebugs.Count <= 0 then
    result := false
  else
  begin
    result := true;
    for i := 0 to Pred(StateDebugs.Count) do
    begin
      if (TStateRef(StateDebugs[i]).FirstLine < 0)
        or (TStateRef(StateDebugs[i]).FirstLine >= Listing.Count)
        or (TStateRef(StateDebugs[i]).LastLine < 0)
        or (TStateRef(StateDebugs[i]).LastLine >= Listing.Count) then
      begin
        result := false;
        exit;
      end;

      if TStateRef(StateDebugs[i]).LastLine <
         TStateRef(StateDebugs[i]).FirstLine then
      begin
        result := false;
        exit;
      end;
    end;
    if StateDebugs.Count > 1 then
    begin
      for i := 1 to Pred(StateDebugs.Count) do
      begin
        if TStateRef(StateDebugs[Pred(i)]).StateNumber >=
           TStateRef(StateDebugs[i]).StateNumber then
        begin
          result := false;
          exit;
        end;
        //Not an exhaustive line number interection check,
        //but will do in most cases.
        if TStateRef(StateDebugs[Pred(i)]).LastLine >=
           TStateRef(StateDebugs[i]).FirstLine then
        begin
          result := false;
          exit;
        end;
      end;
    end;
  end;
end;

function CalcStateRefs: boolean;

var
  i: integer;
  CurRef: TStateRef;
  StateNum: integer;

  function MatchStart(LineStr: string): boolean;
  const
    //state 12:
    state_prefix = 'state ';
  var
    j: integer;
    NumStr: string;
  begin
    result := false;
    if LineStr.Substring(0, 6) = state_prefix then
    begin
      if LineStr[Length(LineStr)] = ':' then
      begin
        if Pred(Length(LineStr)) >= 7 then
        begin
          result := true;
          for j := 7 to Pred(Length(LineStr)) do
          begin
            if not (Ord(LineStr[j]) >= Ord('0'))
               and (Ord(LineStr[j]) <= Ord('9')) then
            begin
              result := false;
              exit;
            end;
            NumStr := NumStr + LineStr[j];
          end;
          StateNum := StrToInt(NumStr);
        end;
      end;
    end;
  end;

  procedure CloseRef;
  begin
    Assert(Assigned(CurRef));
    CurRef.LastLine := Pred(i);
    CurRef := nil;
  end;

  procedure OpenRef;
  begin
    Assert(not Assigned(CurRef));
    CurRef := TStateRef.Create;
    StateDebugs.Add(CurRef);
    CurRef.StateNumber := StateNum;
    CurRef.FirstLine := i;
  end;

begin
  CurRef := nil;
  for i := 0 to Pred(Listing.Count) do
  begin
    if MatchStart(Listing[i]) then
    begin
      if Assigned(CurRef) then
        CloseRef;
      OpenRef;
    end;
  end;
  i := Listing.Count;
  if Assigned(CurRef) then
    CloseRef;
  StateDebugs.Sort(StateDebugsSort);
  result := CheckStateDebugs;
end;

function GetParams: boolean;
begin
  if ParamCount <> 2 then
  begin
    result := false;
    exit;
  end;
  ListName := ParamStr(1);
  OutName := ParamStr(2);
  if OutName.ToUpper.Substring(OutName.Length - 4) = '.PAS' then
    OutUnitName := OutName.Substring(0, OutName.Length - 4)
  else
    OutUnitName := OutName;
  while (OutUnitName.IndexOf('\') >= 0) do
    OutUnitName := OutUnitName.Substring(Succ(OutUnitName.IndexOf('\')));
  result := true;
end;

function OpenFiles: boolean;
begin
  result := false;
  try
    Listing.LoadFromFile(ListName);
  except
    on E: Exception do
    begin
      WriteLn('Read ' + ListName + ' failed: ' +E.Message);
      exit;
    end;
  end;
  try
    Assign(OutFile, OutName);
    Rewrite(OutFile);
    if IoResult <> 0 then
      raise Exception.Create('IOResult : ' + IntToStr(IoResult));
  except
    on E: Exception do
    begin
      WriteLn('Open output ' + OutName + ' failed: ' +E.Message);
      exit;
    end;
  end;
  result := true;
end;

procedure Usage;
begin
  WriteLn('genstate_debug: <input listing file> <output pascal file>');
end;

begin
  try
    if not GetParams then
    begin
      Usage;
      halt(1);
    end;
    try
      Listing := TStringList.Create;
      StateDebugs := TList.Create;
      if not OpenFiles then
        halt(1);
      if not CalcStateRefs then
        halt(1);
      if not GenOutput then
        halt(1);
    finally
      for i := 0 to Pred(StateDebugs.Count) do
        TObject(StateDebugs[i]).Free;
      StateDebugs.Free;
      Listing.Free;
      Close(OutFile);
      halt(0);
    end;
  except
    on E: Exception do
    begin
      Writeln(E.ClassName, ': ', E.Message);
      halt(1);
    end;
  end;
end.
