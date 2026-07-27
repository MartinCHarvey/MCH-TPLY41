unit LexClassDefs;

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
function GetClassDef(Idx: integer; var Def: string): integer;
function AddClassDef(Def: string): integer;

implementation

var
  _Name: string;
  _Defs: TStringList;

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

function GetClassDef(Idx: integer; var Def: string): integer;
begin
  if (Idx >= 0) and (Idx < _Defs.Count) then
  begin
    Def := _Defs[Idx];
    result := 0;
  end
  else
    result := -1;
end;

function AddClassDef(Def: string): integer;
begin
  _Defs.Add(Def);
  result := 0;
end;

initialization
  _Defs := TStringList.Create;
finalization
  _Defs.Free;
end.
