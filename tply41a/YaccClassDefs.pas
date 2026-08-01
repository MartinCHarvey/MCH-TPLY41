unit YaccClassDefs;

{
  Copyright (C) 2026     Martin Harvey <martin_c_harvey@hotmail.com>

  This program is free software; you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation; either version 2 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program; if not, write to the Free Software
  Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
}

interface

uses
  Classes;

function SetClassName(Name:string): integer;
function GetClassName(var Name:string): integer;

function GetClassFunc(Idx: integer; var Def: string): integer;
function AddClassFunc(Def: string): integer;

function GetClassVar(Idx: integer; var Def: string): integer;
function AddClassVar(Def: string): integer;

implementation

var
  _Name: string;
  _Vars: TStringList;
  _Funcs: TStringList;

function SetClassName(Name:string): integer;
begin
  if (Length(_Name) = 0) and (Length(Name) <> 0) then
  begin
    _Name := Name;
    result := 0;
  end
  else
    result := -1;
end;

function GetClassName(var Name:string): integer;
begin
  if Length(_Name) <> 0 then
  begin
    Name := _Name;
    result := 0;
  end
  else
    result := -1;
end;

function GetClassFunc(Idx: integer; var Def: string): integer;
begin
  if (Idx >= 0) and (Idx < _Funcs.Count) then
  begin
    Def := _Funcs[Idx];
    result := 0;
  end
  else
    result := -1;
end;

function AddClassFunc(Def: string): integer;
begin
  _Funcs.Add(Def);
  result := 0;
end;

function GetClassVar(Idx: integer; var Def: string): integer;
begin
  if (Idx >= 0) and (Idx < _Vars.Count) then
  begin
    Def := _Vars[Idx];
    result := 0;
  end
  else
    result := -1;
end;

function AddClassVar(Def: string): integer;
begin
  _Vars.Add(Def);
  result := 0;
end;

initialization
  _Vars := TStringList.Create;
  _Funcs := TStringList.Create;
finalization
  _Vars.Free;
  _Funcs.Free;
end.
