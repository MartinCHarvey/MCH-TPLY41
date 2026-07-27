
(* Yacc parser template (TP Yacc V3.0), V1.2 6-17-91 AG *)

(* global definitions: *)

(*

  TP Yacc - Yet Another Compiler Compiler for Turbo Pascal

  Copyright (C) 1990-92  Albert Graef <ag@muwiinfa.geschichte.uni-mainz.de>
  Copyright (C) 1996     Berend de Boer <berend@pobox.com>

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


$Revision: 2 $
$Modtime: 96-08-01 11:24 $

   2-17-91, 4-30-91 AG - MCH Mod 1 (2026)


Last changes:

  Version 3.0 as of April 91
  Version 3.0a as of May 92 (bug fixes in precedence and type information
    updates)

$History: YACC.PAS $
 * 
 * *****************  Version 2  *****************
 * User: Berend       Date: 96-10-10   Time: 21:16
 * Updated in $/Lex and Yacc/tply
 * Updated for protected mode, windows and Delphi 1.X and 2.X.



------------------------- Synopsis ------------------------

   Synopsis   yacc [options] yacc-file[.y] [output-file[.pas]]

   Options

   -v  "Verbose:" Yacc generates a readable description of the generated
       parser, written to yacc-file with new extension .lst.

   -d  "Debug:" Yacc generates parser with debugging output.

   -oo "Object-Oriented:" Use OO syntax and templates.

   Description

   This is a reimplementation of the popular UNIX compiler generator
   Yacc for MS-DOS and Turbo Pascal.

   Differences from UNIX Yacc:

   - Produces output code for Turbo Pascal, rather than for C.

   - Does not support %union definitions. Instead, a value type is declared
     by specifying the type identifier *itself* as the tag of a %token
     or %type definition. Yacc will automatically generate an appropriate
     yylval variable of a variant record type (YYSType) which is capable of
     holding values of any of the types used in %token and %type.

     Type checking is *very* strict. If you use type definitions, then
     any symbol referred to in an action *must* have a type introduced
     in a type definition. Either the symbol must have been assigned a
     type in the definitions section, or the $<type-identifier> notation
     must be used. The syntax of the %type definition has been changed
     slightly to allow definitions of the form
       %type <type-identifier>
     (omitting the nonterminals) which may be used to declare types which
     are not assigned to any grammar symbol, but are used with the
     $<...> construct.

   - The parse tables constructed by this Yacc version are slightly greater
     than those constructed by UNIX Yacc, since a reduce action will only be
     chosen as the default action if it is the *only* action in the state.
     In difference, UNIX Yacc chooses a reduce action as the default action
     whenever it is the only *reduce* action of the state (even if there are
     other shift actions).

     This solves a bug in UNIX Yacc that makes the generated parser start
     error recovery too late with certain types of error productions (see
     also Schreiner/Friedman, "Introduction to compiler construction with
     UNIX," 1985). Also, errors will be caught sooner in most cases where
     standard Yacc would carry out an additional (default) reduction before
     detecting the error.

------------------------- Synopsis ------------------------

*)

{$IFDEF MsDos}
{$M 16384,0,655360}
{$ENDIF}
{$IFDEF DPMI}
{$M 32768}
{$ENDIF}
{$IFDEF Windows}
{$M 32768,0}
{$ENDIF}

{$X+}
{$I-}
program Yacc;

uses
  SysUtils,
{$IFDEF Debug}
{$IFDEF DPMI}
  YaccChk,
{$ENDIF}
{$ENDIF}
{$IFDEF Windows}
{$IFNDEF Console}
  WinCrt,
{$ENDIF}
{$ENDIF}
  YaccLib, YaccBase, YaccMsgs, YaccSem, YaccTabl, YaccPars, ClassDefs;

const ID = 257;
const C_ID = 258;
const LITERAL = 259;
const LITID = 260;
const NUMBER = 261;
const PTOKEN = 262;
const PLEFT = 263;
const PRIGHT = 264;
const PNONASSOC = 265;
const PTYPE = 266;
const PSTART = 267;
const PPREC = 268;
const PCLASSNAME = 269;
const PCLASSDEF = 270;
const PP = 271;
const LCURL = 272;
const RCURL = 273;
const ILLEGAL = 274;

var yylval : YYSType;

function yylex : Integer; forward;

function yyparse : Integer;

var yystate, yysp, yyn : Integer;
    yys : array [1..yymaxdepth] of Integer;
    yyv : array [1..yymaxdepth] of YYSType;
    yyval : YYSType;

procedure yyaction ( yyruleno : Integer );
  (* local definitions: *)
begin
  (* actions: *)
  case yyruleno of
   1 : begin
         yyval := yyv[yysp-0];
       end;
   2 : begin
         yyval := yyv[yysp-0];
       end;
   3 : begin
         yyval := yyv[yysp-0];
       end;
   4 : begin
         yyval := yyv[yysp-0];
       end;
   5 : begin
         yyval := yyv[yysp-0];
       end;
   6 : begin
         yyerrok; 
       end;
   7 : begin
         yyerrok; 
       end;
   8 : begin
         yyerrok; 
       end;
   9 : begin
         yyerrok; 
       end;
  10 : begin
         yyerrok; 
       end;
  11 : begin
         yyerrok; 
       end;
  12 : begin
         yyerrok; 
       end;
  13 : begin
         yyerrok; 
       end;
  14 : begin
         yyval := yyv[yysp-0];
       end;
  15 : begin
         yyerrok; 
       end;
  16 : begin
         yyval := yyv[yysp-0];
       end;
  17 : begin
         yyval := yyv[yysp-0];
       end;
  18 : begin
         error(rcurl_expected); 
       end;
  19 : begin
         yyval := yyv[yysp-0];
       end;
  20 : begin
         yyerrok; 
       end;
  21 : begin
         yyerrok; 
       end;
  22 : begin
         yyerrok; 
       end;
  23 : begin
         yyval := yyv[yysp-0];
       end;
  24 : begin
         yyval := yyv[yysp-0];
       end;
  25 : begin
         error(rbrace_expected); 
       end;
  26 : begin
         yyval := yyv[yysp-0];
       end;
  27 : begin
         yyval := yyv[yysp-0];
       end;
  28 : begin
         error(rangle_expected); 
       end;
  29 : begin
         yyval := yyv[yysp-0];
       end;
  30 : begin
         sort_types;
         definitions;
         next_section; 
       end;
  31 : begin
         next_section;
         generate_parser;
         next_section; 
       end;
  32 : begin
         yyval := yyv[yysp-5];
       end;
  33 : begin
       end;
  34 : begin
         copy_rest_of_file; 
       end;
  35 : begin
       end;
  36 : begin
         yyerrok; 
       end;
  37 : begin
         error(error_in_def); 
       end;
  38 : begin
         startnt := ntsym(yyv[yysp-0]); 
       end;
  39 : begin
         error(ident_expected); 
       end;
  40 : begin
         copy_code; 
       end;
  41 : begin
         yyval := yyv[yysp-2];
       end;
  42 : begin
         act_prec := 0; 
       end;
  43 : begin
         yyval := yyv[yysp-3];
       end;
  44 : begin
         act_prec := new_prec_level(left); 
       end;
  45 : begin
         yyval := yyv[yysp-3];
       end;
  46 : begin
         act_prec := new_prec_level(right); 
       end;
  47 : begin
         yyval := yyv[yysp-3];
       end;
  48 : begin
         act_prec := new_prec_level(nonassoc); 
       end;
  49 : begin
         yyval := yyv[yysp-3];
       end;
  50 : begin
         yyval := yyv[yysp-2];
       end;
  51 : begin
         yyval := yyv[yysp-1];
       end;
  52 : begin
         (* Rely on custom lexer to add classname *) 
       end;
  53 : begin
         (* Rely on custom lexer to add classdef *) 
       end;
  54 : begin
         act_type := 0; 
       end;
  55 : begin
         act_type := yyv[yysp-1]; add_type(yyv[yysp-1]); 
       end;
  56 : begin
         yyval := yyv[yysp-0];
       end;
  57 : begin
         yyerrok; 
       end;
  58 : begin
         yyerrok; 
       end;
  59 : begin
         error(ident_expected); 
       end;
  60 : begin
         error(error_in_def); 
       end;
  61 : begin
         error(ident_expected); 
       end;
  62 : begin
         if act_type<>0 then
         sym_type^[yyv[yysp-0]] := act_type;
         if act_prec<>0 then
         sym_prec^[yyv[yysp-0]] := act_prec; 
       end;
  63 : begin
         litsym(yyv[yysp-0], 0);
         if act_type<>0 then
         sym_type^[litsym(yyv[yysp-0], 0)] := act_type;
         if act_prec<>0 then
         sym_prec^[litsym(yyv[yysp-0], 0)] := act_prec; 
       end;
  64 : begin
         litsym(yyv[yysp-0], 0);
         if act_type<>0 then
         sym_type^[litsym(yyv[yysp-0], 0)] := act_type;
         if act_prec<>0 then
         sym_prec^[litsym(yyv[yysp-0], 0)] := act_prec; 
       end;
  65 : begin
         litsym(yyv[yysp-1], 0);
         if act_type<>0 then
         sym_type^[litsym(yyv[yysp-1], yyv[yysp-0])] := act_type;
         if act_prec<>0 then
         sym_prec^[litsym(yyv[yysp-1], 0)]  := act_prec; 
       end;
  66 : begin
         litsym(yyv[yysp-1], 0);
         if act_type<>0 then
         sym_type^[litsym(yyv[yysp-1], yyv[yysp-0])] := act_type;
         if act_prec<>0 then
         sym_prec^[litsym(yyv[yysp-1], 0)]  := act_prec; 
       end;
  67 : begin
         yyval := yyv[yysp-0];
       end;
  68 : begin
         yyerrok; 
       end;
  69 : begin
         yyerrok; 
       end;
  70 : begin
         error(ident_expected); 
       end;
  71 : begin
         error(error_in_def); 
       end;
  72 : begin
         error(ident_expected); 
       end;
  73 : begin
         if act_type<>0 then
         sym_type^[ntsym(yyv[yysp-0])] := act_type; 
       end;
  74 : begin
         next_section; 
       end;
  75 : begin
         yyval := yyv[yysp-1];
       end;
  76 : begin
         copy_code; 
       end;
  77 : begin
         next_section; 
       end;
  78 : begin
         yyval := yyv[yysp-4];
       end;
  79 : begin
         yyerrok; 
       end;
  80 : begin
         error(error_in_rule); 
       end;
  81 : begin
         error(error_in_rule); 
       end;
  82 : begin
         start_rule(ntsym(yyv[yysp-0])); 
       end;
  83 : begin
         start_body; 
       end;
  84 : begin
         end_body; 
       end;
  85 : begin
         yyval := yyv[yysp-0];
       end;
  86 : begin
         start_body; 
       end;
  87 : begin
         end_body; 
       end;
  88 : begin
       end;
  89 : begin
         add_symbol(yyv[yysp-0]); yyerrok; 
       end;
  90 : begin
         add_symbol(sym(yyv[yysp-0])); yyerrok; 
       end;
  91 : begin
         add_symbol(sym(yyv[yysp-0])); yyerrok; 
       end;
  92 : begin
         add_action; yyerrok; 
       end;
  93 : begin
         error(error_in_rule); 
       end;
  94 : begin
         copy_action; 
       end;
  95 : begin
         yyval := yyv[yysp-2];
       end;
  96 : begin
         copy_single_action; 
       end;
  97 : begin
       end;
  98 : begin
         add_rule_prec(yyv[yysp-0]); 
       end;
  99 : begin
         yyval := yyv[yysp-3];
       end;
 100 : begin
         add_rule_prec(litsym(yyv[yysp-0], 0)); 
       end;
 101 : begin
         yyval := yyv[yysp-3];
       end;
 102 : begin
         add_rule_prec(litsym(yyv[yysp-0], 0)); 
       end;
 103 : begin
         yyval := yyv[yysp-3];
       end;
 104 : begin
         yyval := yyv[yysp-1];
       end;
 105 : begin
       end;
 106 : begin
         add_action; 
       end;
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

yynacts   = 271;
yyngotos  = 148;
yynstates = 132;
yynrules  = 106;

yya : array [1..yynacts] of YYARec = (
{ 0: }
{ 1: }
  ( sym: 256; act: 14 ),
  ( sym: 262; act: 15 ),
  ( sym: 263; act: 16 ),
  ( sym: 264; act: 17 ),
  ( sym: 265; act: 18 ),
  ( sym: 266; act: 19 ),
  ( sym: 267; act: 20 ),
  ( sym: 269; act: 21 ),
  ( sym: 270; act: 22 ),
  ( sym: 271; act: 23 ),
  ( sym: 272; act: 24 ),
{ 2: }
  ( sym: 0; act: 0 ),
{ 3: }
{ 4: }
{ 5: }
{ 6: }
{ 7: }
{ 8: }
  ( sym: 256; act: 28 ),
  ( sym: 257; act: 29 ),
{ 9: }
  ( sym: 60; act: 32 ),
  ( sym: 256; act: -54 ),
  ( sym: 257; act: -54 ),
  ( sym: 262; act: -54 ),
  ( sym: 263; act: -54 ),
  ( sym: 264; act: -54 ),
  ( sym: 265; act: -54 ),
  ( sym: 266; act: -54 ),
  ( sym: 267; act: -54 ),
  ( sym: 269; act: -54 ),
  ( sym: 270; act: -54 ),
  ( sym: 271; act: -54 ),
  ( sym: 272; act: -54 ),
{ 10: }
{ 11: }
{ 12: }
{ 13: }
{ 14: }
{ 15: }
{ 16: }
{ 17: }
{ 18: }
{ 19: }
{ 20: }
{ 21: }
{ 22: }
{ 23: }
{ 24: }
{ 25: }
  ( sym: 256; act: 38 ),
  ( sym: 273; act: 39 ),
{ 26: }
  ( sym: 256; act: 43 ),
  ( sym: 272; act: 24 ),
  ( sym: 258; act: -74 ),
{ 27: }
{ 28: }
{ 29: }
{ 30: }
  ( sym: 256; act: 47 ),
  ( sym: 257; act: 29 ),
  ( sym: 262; act: -51 ),
  ( sym: 263; act: -51 ),
  ( sym: 264; act: -51 ),
  ( sym: 265; act: -51 ),
  ( sym: 266; act: -51 ),
  ( sym: 267; act: -51 ),
  ( sym: 269; act: -51 ),
  ( sym: 270; act: -51 ),
  ( sym: 271; act: -51 ),
  ( sym: 272; act: -51 ),
{ 31: }
  ( sym: 257; act: 29 ),
{ 32: }
{ 33: }
  ( sym: 60; act: 32 ),
  ( sym: 256; act: -54 ),
  ( sym: 257; act: -54 ),
  ( sym: 259; act: -54 ),
  ( sym: 260; act: -54 ),
{ 34: }
  ( sym: 60; act: 32 ),
  ( sym: 256; act: -54 ),
  ( sym: 257; act: -54 ),
  ( sym: 259; act: -54 ),
  ( sym: 260; act: -54 ),
{ 35: }
  ( sym: 60; act: 32 ),
  ( sym: 256; act: -54 ),
  ( sym: 257; act: -54 ),
  ( sym: 259; act: -54 ),
  ( sym: 260; act: -54 ),
{ 36: }
  ( sym: 60; act: 32 ),
  ( sym: 256; act: -54 ),
  ( sym: 257; act: -54 ),
  ( sym: 259; act: -54 ),
  ( sym: 260; act: -54 ),
{ 37: }
{ 38: }
{ 39: }
{ 40: }
  ( sym: 258; act: 55 ),
{ 41: }
  ( sym: 124; act: 60 ),
  ( sym: 256; act: 61 ),
  ( sym: 258; act: 55 ),
  ( sym: 0; act: -31 ),
  ( sym: 271; act: -31 ),
{ 42: }
{ 43: }
{ 44: }
{ 45: }
  ( sym: 44; act: 65 ),
  ( sym: 256; act: 66 ),
  ( sym: 257; act: 29 ),
  ( sym: 262; act: -50 ),
  ( sym: 263; act: -50 ),
  ( sym: 264; act: -50 ),
  ( sym: 265; act: -50 ),
  ( sym: 266; act: -50 ),
  ( sym: 267; act: -50 ),
  ( sym: 269; act: -50 ),
  ( sym: 270; act: -50 ),
  ( sym: 271; act: -50 ),
  ( sym: 272; act: -50 ),
{ 46: }
{ 47: }
{ 48: }
  ( sym: 62; act: 68 ),
  ( sym: 256; act: 69 ),
{ 49: }
  ( sym: 256; act: 75 ),
  ( sym: 257; act: 29 ),
  ( sym: 259; act: 76 ),
  ( sym: 260; act: 77 ),
{ 50: }
  ( sym: 256; act: 75 ),
  ( sym: 257; act: 29 ),
  ( sym: 259; act: 76 ),
  ( sym: 260; act: 77 ),
{ 51: }
  ( sym: 256; act: 75 ),
  ( sym: 257; act: 29 ),
  ( sym: 259; act: 76 ),
  ( sym: 260; act: 77 ),
{ 52: }
  ( sym: 256; act: 75 ),
  ( sym: 257; act: 29 ),
  ( sym: 259; act: 76 ),
  ( sym: 260; act: 77 ),
{ 53: }
{ 54: }
{ 55: }
{ 56: }
{ 57: }
{ 58: }
  ( sym: 271; act: 23 ),
  ( sym: 0; act: -33 ),
{ 59: }
{ 60: }
{ 61: }
{ 62: }
  ( sym: 256; act: 38 ),
  ( sym: 273; act: 39 ),
{ 63: }
{ 64: }
  ( sym: 256; act: 87 ),
  ( sym: 257; act: 29 ),
{ 65: }
{ 66: }
{ 67: }
{ 68: }
{ 69: }
{ 70: }
{ 71: }
  ( sym: 44; act: 65 ),
  ( sym: 256; act: 90 ),
  ( sym: 257; act: 29 ),
  ( sym: 259; act: 76 ),
  ( sym: 260; act: 77 ),
  ( sym: 262; act: -49 ),
  ( sym: 263; act: -49 ),
  ( sym: 264; act: -49 ),
  ( sym: 265; act: -49 ),
  ( sym: 266; act: -49 ),
  ( sym: 267; act: -49 ),
  ( sym: 269; act: -49 ),
  ( sym: 270; act: -49 ),
  ( sym: 271; act: -49 ),
  ( sym: 272; act: -49 ),
{ 72: }
  ( sym: 261; act: 92 ),
  ( sym: 44; act: -63 ),
  ( sym: 256; act: -63 ),
  ( sym: 257; act: -63 ),
  ( sym: 259; act: -63 ),
  ( sym: 260; act: -63 ),
  ( sym: 262; act: -63 ),
  ( sym: 263; act: -63 ),
  ( sym: 264; act: -63 ),
  ( sym: 265; act: -63 ),
  ( sym: 266; act: -63 ),
  ( sym: 267; act: -63 ),
  ( sym: 269; act: -63 ),
  ( sym: 270; act: -63 ),
  ( sym: 271; act: -63 ),
  ( sym: 272; act: -63 ),
{ 73: }
{ 74: }
  ( sym: 261; act: 92 ),
  ( sym: 44; act: -64 ),
  ( sym: 256; act: -64 ),
  ( sym: 257; act: -64 ),
  ( sym: 259; act: -64 ),
  ( sym: 260; act: -64 ),
  ( sym: 262; act: -64 ),
  ( sym: 263; act: -64 ),
  ( sym: 264; act: -64 ),
  ( sym: 265; act: -64 ),
  ( sym: 266; act: -64 ),
  ( sym: 267; act: -64 ),
  ( sym: 269; act: -64 ),
  ( sym: 270; act: -64 ),
  ( sym: 271; act: -64 ),
  ( sym: 272; act: -64 ),
{ 75: }
{ 76: }
{ 77: }
{ 78: }
  ( sym: 44; act: 65 ),
  ( sym: 256; act: 90 ),
  ( sym: 257; act: 29 ),
  ( sym: 259; act: 76 ),
  ( sym: 260; act: 77 ),
  ( sym: 262; act: -47 ),
  ( sym: 263; act: -47 ),
  ( sym: 264; act: -47 ),
  ( sym: 265; act: -47 ),
  ( sym: 266; act: -47 ),
  ( sym: 267; act: -47 ),
  ( sym: 269; act: -47 ),
  ( sym: 270; act: -47 ),
  ( sym: 271; act: -47 ),
  ( sym: 272; act: -47 ),
{ 79: }
  ( sym: 44; act: 65 ),
  ( sym: 256; act: 90 ),
  ( sym: 257; act: 29 ),
  ( sym: 259; act: 76 ),
  ( sym: 260; act: 77 ),
  ( sym: 262; act: -45 ),
  ( sym: 263; act: -45 ),
  ( sym: 264; act: -45 ),
  ( sym: 265; act: -45 ),
  ( sym: 266; act: -45 ),
  ( sym: 267; act: -45 ),
  ( sym: 269; act: -45 ),
  ( sym: 270; act: -45 ),
  ( sym: 271; act: -45 ),
  ( sym: 272; act: -45 ),
{ 80: }
  ( sym: 44; act: 65 ),
  ( sym: 256; act: 90 ),
  ( sym: 257; act: 29 ),
  ( sym: 259; act: 76 ),
  ( sym: 260; act: 77 ),
  ( sym: 262; act: -43 ),
  ( sym: 263; act: -43 ),
  ( sym: 264; act: -43 ),
  ( sym: 265; act: -43 ),
  ( sym: 266; act: -43 ),
  ( sym: 267; act: -43 ),
  ( sym: 269; act: -43 ),
  ( sym: 270; act: -43 ),
  ( sym: 271; act: -43 ),
  ( sym: 272; act: -43 ),
{ 81: }
  ( sym: 58; act: 95 ),
{ 82: }
{ 83: }
{ 84: }
{ 85: }
{ 86: }
{ 87: }
{ 88: }
{ 89: }
  ( sym: 256; act: 99 ),
  ( sym: 257; act: 29 ),
  ( sym: 259; act: 76 ),
  ( sym: 260; act: 77 ),
{ 90: }
{ 91: }
{ 92: }
{ 93: }
{ 94: }
{ 95: }
{ 96: }
  ( sym: 61; act: 109 ),
  ( sym: 123; act: 110 ),
  ( sym: 256; act: 111 ),
  ( sym: 257; act: 29 ),
  ( sym: 259; act: 76 ),
  ( sym: 260; act: 77 ),
  ( sym: 268; act: 112 ),
  ( sym: 0; act: -97 ),
  ( sym: 59; act: -97 ),
  ( sym: 124; act: -97 ),
  ( sym: 258; act: -97 ),
  ( sym: 271; act: -97 ),
{ 97: }
  ( sym: 258; act: 55 ),
{ 98: }
{ 99: }
{ 100: }
{ 101: }
{ 102: }
  ( sym: 59; act: 116 ),
  ( sym: 0; act: -87 ),
  ( sym: 124; act: -87 ),
  ( sym: 256; act: -87 ),
  ( sym: 258; act: -87 ),
  ( sym: 271; act: -87 ),
{ 103: }
{ 104: }
{ 105: }
  ( sym: 257; act: 29 ),
  ( sym: 259; act: 76 ),
  ( sym: 260; act: 77 ),
{ 106: }
{ 107: }
{ 108: }
{ 109: }
{ 110: }
{ 111: }
{ 112: }
{ 113: }
{ 114: }
  ( sym: 61; act: 109 ),
  ( sym: 123; act: 110 ),
  ( sym: 256; act: 111 ),
  ( sym: 257; act: 29 ),
  ( sym: 259; act: 76 ),
  ( sym: 260; act: 77 ),
  ( sym: 268; act: 112 ),
  ( sym: 0; act: -97 ),
  ( sym: 59; act: -97 ),
  ( sym: 124; act: -97 ),
  ( sym: 258; act: -97 ),
  ( sym: 271; act: -97 ),
{ 115: }
{ 116: }
{ 117: }
  ( sym: 125; act: 123 ),
  ( sym: 256; act: 124 ),
{ 118: }
{ 119: }
{ 120: }
{ 121: }
  ( sym: 59; act: 116 ),
  ( sym: 0; act: -84 ),
  ( sym: 124; act: -84 ),
  ( sym: 256; act: -84 ),
  ( sym: 258; act: -84 ),
  ( sym: 271; act: -84 ),
{ 122: }
{ 123: }
{ 124: }
{ 125: }
  ( sym: 61; act: 109 ),
  ( sym: 123; act: 110 ),
  ( sym: 0; act: -105 ),
  ( sym: 59; act: -105 ),
  ( sym: 124; act: -105 ),
  ( sym: 256; act: -105 ),
  ( sym: 258; act: -105 ),
  ( sym: 271; act: -105 ),
{ 126: }
  ( sym: 61; act: 109 ),
  ( sym: 123; act: 110 ),
  ( sym: 0; act: -105 ),
  ( sym: 59; act: -105 ),
  ( sym: 124; act: -105 ),
  ( sym: 256; act: -105 ),
  ( sym: 258; act: -105 ),
  ( sym: 271; act: -105 ),
{ 127: }
  ( sym: 61; act: 109 ),
  ( sym: 123; act: 110 ),
  ( sym: 0; act: -105 ),
  ( sym: 59; act: -105 ),
  ( sym: 124; act: -105 ),
  ( sym: 256; act: -105 ),
  ( sym: 258; act: -105 ),
  ( sym: 271; act: -105 )
{ 128: }
{ 129: }
{ 130: }
{ 131: }
);

yyg : array [1..yyngotos] of YYARec = (
{ 0: }
  ( sym: -29; act: 1 ),
  ( sym: -2; act: 2 ),
{ 1: }
  ( sym: -34; act: 3 ),
  ( sym: -18; act: 4 ),
  ( sym: -17; act: 5 ),
  ( sym: -15; act: 6 ),
  ( sym: -14; act: 7 ),
  ( sym: -13; act: 8 ),
  ( sym: -12; act: 9 ),
  ( sym: -11; act: 10 ),
  ( sym: -10; act: 11 ),
  ( sym: -9; act: 12 ),
  ( sym: -8; act: 13 ),
{ 2: }
{ 3: }
{ 4: }
  ( sym: -35; act: 25 ),
{ 5: }
  ( sym: -31; act: 26 ),
{ 6: }
{ 7: }
{ 8: }
  ( sym: -3; act: 27 ),
{ 9: }
  ( sym: -36; act: 30 ),
  ( sym: -26; act: 31 ),
{ 10: }
  ( sym: -41; act: 33 ),
{ 11: }
  ( sym: -40; act: 34 ),
{ 12: }
  ( sym: -39; act: 35 ),
{ 13: }
  ( sym: -37; act: 36 ),
{ 14: }
{ 15: }
{ 16: }
{ 17: }
{ 18: }
{ 19: }
{ 20: }
{ 21: }
{ 22: }
{ 23: }
{ 24: }
{ 25: }
  ( sym: -19; act: 37 ),
{ 26: }
  ( sym: -46; act: 40 ),
  ( sym: -30; act: 41 ),
  ( sym: -18; act: 42 ),
{ 27: }
{ 28: }
{ 29: }
{ 30: }
  ( sym: -44; act: 44 ),
  ( sym: -42; act: 45 ),
  ( sym: -3; act: 46 ),
{ 31: }
  ( sym: -3; act: 48 ),
{ 32: }
{ 33: }
  ( sym: -36; act: 49 ),
  ( sym: -26; act: 31 ),
{ 34: }
  ( sym: -36; act: 50 ),
  ( sym: -26; act: 31 ),
{ 35: }
  ( sym: -36; act: 51 ),
  ( sym: -26; act: 31 ),
{ 36: }
  ( sym: -36; act: 52 ),
  ( sym: -26; act: 31 ),
{ 37: }
{ 38: }
{ 39: }
{ 40: }
  ( sym: -45; act: 53 ),
  ( sym: -4; act: 54 ),
{ 41: }
  ( sym: -49; act: 56 ),
  ( sym: -45; act: 57 ),
  ( sym: -33; act: 58 ),
  ( sym: -23; act: 59 ),
  ( sym: -4; act: 54 ),
{ 42: }
  ( sym: -47; act: 62 ),
{ 43: }
{ 44: }
{ 45: }
  ( sym: -44; act: 63 ),
  ( sym: -20; act: 64 ),
  ( sym: -3; act: 46 ),
{ 46: }
{ 47: }
{ 48: }
  ( sym: -27; act: 67 ),
{ 49: }
  ( sym: -43; act: 70 ),
  ( sym: -38; act: 71 ),
  ( sym: -6; act: 72 ),
  ( sym: -5; act: 73 ),
  ( sym: -3; act: 74 ),
{ 50: }
  ( sym: -43; act: 70 ),
  ( sym: -38; act: 78 ),
  ( sym: -6; act: 72 ),
  ( sym: -5; act: 73 ),
  ( sym: -3; act: 74 ),
{ 51: }
  ( sym: -43; act: 70 ),
  ( sym: -38; act: 79 ),
  ( sym: -6; act: 72 ),
  ( sym: -5; act: 73 ),
  ( sym: -3; act: 74 ),
{ 52: }
  ( sym: -43; act: 70 ),
  ( sym: -38; act: 80 ),
  ( sym: -6; act: 72 ),
  ( sym: -5; act: 73 ),
  ( sym: -3; act: 74 ),
{ 53: }
{ 54: }
  ( sym: -50; act: 81 ),
{ 55: }
{ 56: }
{ 57: }
{ 58: }
  ( sym: -32; act: 82 ),
  ( sym: -17; act: 83 ),
{ 59: }
  ( sym: -54; act: 84 ),
{ 60: }
{ 61: }
{ 62: }
  ( sym: -19; act: 85 ),
{ 63: }
{ 64: }
  ( sym: -44; act: 86 ),
  ( sym: -3; act: 46 ),
{ 65: }
{ 66: }
{ 67: }
{ 68: }
{ 69: }
{ 70: }
{ 71: }
  ( sym: -43; act: 88 ),
  ( sym: -20; act: 89 ),
  ( sym: -6; act: 72 ),
  ( sym: -5; act: 73 ),
  ( sym: -3; act: 74 ),
{ 72: }
  ( sym: -7; act: 91 ),
{ 73: }
{ 74: }
  ( sym: -7; act: 93 ),
{ 75: }
{ 76: }
{ 77: }
{ 78: }
  ( sym: -43; act: 88 ),
  ( sym: -20; act: 89 ),
  ( sym: -6; act: 72 ),
  ( sym: -5; act: 73 ),
  ( sym: -3; act: 74 ),
{ 79: }
  ( sym: -43; act: 88 ),
  ( sym: -20; act: 89 ),
  ( sym: -6; act: 72 ),
  ( sym: -5; act: 73 ),
  ( sym: -3; act: 74 ),
{ 80: }
  ( sym: -43; act: 88 ),
  ( sym: -20; act: 89 ),
  ( sym: -6; act: 72 ),
  ( sym: -5; act: 73 ),
  ( sym: -3; act: 74 ),
{ 81: }
  ( sym: -21; act: 94 ),
{ 82: }
{ 83: }
{ 84: }
  ( sym: -51; act: 96 ),
{ 85: }
  ( sym: -48; act: 97 ),
{ 86: }
{ 87: }
{ 88: }
{ 89: }
  ( sym: -43; act: 98 ),
  ( sym: -6; act: 72 ),
  ( sym: -5; act: 73 ),
  ( sym: -3; act: 74 ),
{ 90: }
{ 91: }
{ 92: }
{ 93: }
{ 94: }
  ( sym: -52; act: 100 ),
{ 95: }
{ 96: }
  ( sym: -55; act: 101 ),
  ( sym: -53; act: 102 ),
  ( sym: -28; act: 103 ),
  ( sym: -24; act: 104 ),
  ( sym: -16; act: 105 ),
  ( sym: -6; act: 106 ),
  ( sym: -5; act: 107 ),
  ( sym: -3; act: 108 ),
{ 97: }
  ( sym: -45; act: 113 ),
  ( sym: -4; act: 54 ),
{ 98: }
{ 99: }
{ 100: }
  ( sym: -51; act: 114 ),
{ 101: }
{ 102: }
  ( sym: -22; act: 115 ),
{ 103: }
{ 104: }
  ( sym: -56; act: 117 ),
{ 105: }
  ( sym: -6; act: 118 ),
  ( sym: -5; act: 119 ),
  ( sym: -3; act: 120 ),
{ 106: }
{ 107: }
{ 108: }
{ 109: }
{ 110: }
{ 111: }
{ 112: }
{ 113: }
{ 114: }
  ( sym: -55; act: 101 ),
  ( sym: -53; act: 121 ),
  ( sym: -28; act: 103 ),
  ( sym: -24; act: 104 ),
  ( sym: -16; act: 105 ),
  ( sym: -6; act: 106 ),
  ( sym: -5; act: 107 ),
  ( sym: -3; act: 108 ),
{ 115: }
{ 116: }
{ 117: }
  ( sym: -25; act: 122 ),
{ 118: }
  ( sym: -59; act: 125 ),
{ 119: }
  ( sym: -58; act: 126 ),
{ 120: }
  ( sym: -60; act: 127 ),
{ 121: }
  ( sym: -22; act: 115 ),
{ 122: }
{ 123: }
{ 124: }
{ 125: }
  ( sym: -57; act: 128 ),
  ( sym: -55; act: 129 ),
  ( sym: -28; act: 103 ),
  ( sym: -24; act: 104 ),
{ 126: }
  ( sym: -57; act: 130 ),
  ( sym: -55; act: 129 ),
  ( sym: -28; act: 103 ),
  ( sym: -24; act: 104 ),
{ 127: }
  ( sym: -57; act: 131 ),
  ( sym: -55; act: 129 ),
  ( sym: -28; act: 103 ),
  ( sym: -24; act: 104 )
{ 128: }
{ 129: }
{ 130: }
{ 131: }
);

yyd : array [0..yynstates-1] of Integer = (
{ 0: } -35,
{ 1: } 0,
{ 2: } 0,
{ 3: } -36,
{ 4: } -40,
{ 5: } -30,
{ 6: } -53,
{ 7: } -52,
{ 8: } 0,
{ 9: } 0,
{ 10: } -48,
{ 11: } -46,
{ 12: } -44,
{ 13: } -42,
{ 14: } -37,
{ 15: } -6,
{ 16: } -7,
{ 17: } -8,
{ 18: } -9,
{ 19: } -10,
{ 20: } -11,
{ 21: } -12,
{ 22: } -13,
{ 23: } -15,
{ 24: } -16,
{ 25: } 0,
{ 26: } 0,
{ 27: } -38,
{ 28: } -39,
{ 29: } -1,
{ 30: } 0,
{ 31: } 0,
{ 32: } -26,
{ 33: } 0,
{ 34: } 0,
{ 35: } 0,
{ 36: } 0,
{ 37: } -41,
{ 38: } -18,
{ 39: } -17,
{ 40: } 0,
{ 41: } 0,
{ 42: } -76,
{ 43: } -80,
{ 44: } -67,
{ 45: } 0,
{ 46: } -73,
{ 47: } -70,
{ 48: } 0,
{ 49: } 0,
{ 50: } 0,
{ 51: } 0,
{ 52: } 0,
{ 53: } -75,
{ 54: } -82,
{ 55: } -2,
{ 56: } -79,
{ 57: } -85,
{ 58: } 0,
{ 59: } -86,
{ 60: } -22,
{ 61: } -81,
{ 62: } 0,
{ 63: } -68,
{ 64: } 0,
{ 65: } -19,
{ 66: } -71,
{ 67: } -55,
{ 68: } -27,
{ 69: } -28,
{ 70: } -56,
{ 71: } 0,
{ 72: } 0,
{ 73: } -62,
{ 74: } 0,
{ 75: } -59,
{ 76: } -3,
{ 77: } -4,
{ 78: } 0,
{ 79: } 0,
{ 80: } 0,
{ 81: } 0,
{ 82: } -32,
{ 83: } -34,
{ 84: } -88,
{ 85: } -77,
{ 86: } -69,
{ 87: } -72,
{ 88: } -57,
{ 89: } 0,
{ 90: } -60,
{ 91: } -65,
{ 92: } -5,
{ 93: } -66,
{ 94: } -83,
{ 95: } -20,
{ 96: } 0,
{ 97: } 0,
{ 98: } -58,
{ 99: } -61,
{ 100: } -88,
{ 101: } -92,
{ 102: } 0,
{ 103: } -96,
{ 104: } -94,
{ 105: } 0,
{ 106: } -90,
{ 107: } -89,
{ 108: } -91,
{ 109: } -29,
{ 110: } -23,
{ 111: } -93,
{ 112: } -14,
{ 113: } -78,
{ 114: } 0,
{ 115: } -104,
{ 116: } -21,
{ 117: } 0,
{ 118: } -100,
{ 119: } -98,
{ 120: } -102,
{ 121: } 0,
{ 122: } -95,
{ 123: } -24,
{ 124: } -25,
{ 125: } 0,
{ 126: } 0,
{ 127: } 0,
{ 128: } -101,
{ 129: } -106,
{ 130: } -99,
{ 131: } -103
);

yyal : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 12,
{ 3: } 13,
{ 4: } 13,
{ 5: } 13,
{ 6: } 13,
{ 7: } 13,
{ 8: } 13,
{ 9: } 15,
{ 10: } 28,
{ 11: } 28,
{ 12: } 28,
{ 13: } 28,
{ 14: } 28,
{ 15: } 28,
{ 16: } 28,
{ 17: } 28,
{ 18: } 28,
{ 19: } 28,
{ 20: } 28,
{ 21: } 28,
{ 22: } 28,
{ 23: } 28,
{ 24: } 28,
{ 25: } 28,
{ 26: } 30,
{ 27: } 33,
{ 28: } 33,
{ 29: } 33,
{ 30: } 33,
{ 31: } 45,
{ 32: } 46,
{ 33: } 46,
{ 34: } 51,
{ 35: } 56,
{ 36: } 61,
{ 37: } 66,
{ 38: } 66,
{ 39: } 66,
{ 40: } 66,
{ 41: } 67,
{ 42: } 72,
{ 43: } 72,
{ 44: } 72,
{ 45: } 72,
{ 46: } 85,
{ 47: } 85,
{ 48: } 85,
{ 49: } 87,
{ 50: } 91,
{ 51: } 95,
{ 52: } 99,
{ 53: } 103,
{ 54: } 103,
{ 55: } 103,
{ 56: } 103,
{ 57: } 103,
{ 58: } 103,
{ 59: } 105,
{ 60: } 105,
{ 61: } 105,
{ 62: } 105,
{ 63: } 107,
{ 64: } 107,
{ 65: } 109,
{ 66: } 109,
{ 67: } 109,
{ 68: } 109,
{ 69: } 109,
{ 70: } 109,
{ 71: } 109,
{ 72: } 124,
{ 73: } 140,
{ 74: } 140,
{ 75: } 156,
{ 76: } 156,
{ 77: } 156,
{ 78: } 156,
{ 79: } 171,
{ 80: } 186,
{ 81: } 201,
{ 82: } 202,
{ 83: } 202,
{ 84: } 202,
{ 85: } 202,
{ 86: } 202,
{ 87: } 202,
{ 88: } 202,
{ 89: } 202,
{ 90: } 206,
{ 91: } 206,
{ 92: } 206,
{ 93: } 206,
{ 94: } 206,
{ 95: } 206,
{ 96: } 206,
{ 97: } 218,
{ 98: } 219,
{ 99: } 219,
{ 100: } 219,
{ 101: } 219,
{ 102: } 219,
{ 103: } 225,
{ 104: } 225,
{ 105: } 225,
{ 106: } 228,
{ 107: } 228,
{ 108: } 228,
{ 109: } 228,
{ 110: } 228,
{ 111: } 228,
{ 112: } 228,
{ 113: } 228,
{ 114: } 228,
{ 115: } 240,
{ 116: } 240,
{ 117: } 240,
{ 118: } 242,
{ 119: } 242,
{ 120: } 242,
{ 121: } 242,
{ 122: } 248,
{ 123: } 248,
{ 124: } 248,
{ 125: } 248,
{ 126: } 256,
{ 127: } 264,
{ 128: } 272,
{ 129: } 272,
{ 130: } 272,
{ 131: } 272
);

yyah : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 11,
{ 2: } 12,
{ 3: } 12,
{ 4: } 12,
{ 5: } 12,
{ 6: } 12,
{ 7: } 12,
{ 8: } 14,
{ 9: } 27,
{ 10: } 27,
{ 11: } 27,
{ 12: } 27,
{ 13: } 27,
{ 14: } 27,
{ 15: } 27,
{ 16: } 27,
{ 17: } 27,
{ 18: } 27,
{ 19: } 27,
{ 20: } 27,
{ 21: } 27,
{ 22: } 27,
{ 23: } 27,
{ 24: } 27,
{ 25: } 29,
{ 26: } 32,
{ 27: } 32,
{ 28: } 32,
{ 29: } 32,
{ 30: } 44,
{ 31: } 45,
{ 32: } 45,
{ 33: } 50,
{ 34: } 55,
{ 35: } 60,
{ 36: } 65,
{ 37: } 65,
{ 38: } 65,
{ 39: } 65,
{ 40: } 66,
{ 41: } 71,
{ 42: } 71,
{ 43: } 71,
{ 44: } 71,
{ 45: } 84,
{ 46: } 84,
{ 47: } 84,
{ 48: } 86,
{ 49: } 90,
{ 50: } 94,
{ 51: } 98,
{ 52: } 102,
{ 53: } 102,
{ 54: } 102,
{ 55: } 102,
{ 56: } 102,
{ 57: } 102,
{ 58: } 104,
{ 59: } 104,
{ 60: } 104,
{ 61: } 104,
{ 62: } 106,
{ 63: } 106,
{ 64: } 108,
{ 65: } 108,
{ 66: } 108,
{ 67: } 108,
{ 68: } 108,
{ 69: } 108,
{ 70: } 108,
{ 71: } 123,
{ 72: } 139,
{ 73: } 139,
{ 74: } 155,
{ 75: } 155,
{ 76: } 155,
{ 77: } 155,
{ 78: } 170,
{ 79: } 185,
{ 80: } 200,
{ 81: } 201,
{ 82: } 201,
{ 83: } 201,
{ 84: } 201,
{ 85: } 201,
{ 86: } 201,
{ 87: } 201,
{ 88: } 201,
{ 89: } 205,
{ 90: } 205,
{ 91: } 205,
{ 92: } 205,
{ 93: } 205,
{ 94: } 205,
{ 95: } 205,
{ 96: } 217,
{ 97: } 218,
{ 98: } 218,
{ 99: } 218,
{ 100: } 218,
{ 101: } 218,
{ 102: } 224,
{ 103: } 224,
{ 104: } 224,
{ 105: } 227,
{ 106: } 227,
{ 107: } 227,
{ 108: } 227,
{ 109: } 227,
{ 110: } 227,
{ 111: } 227,
{ 112: } 227,
{ 113: } 227,
{ 114: } 239,
{ 115: } 239,
{ 116: } 239,
{ 117: } 241,
{ 118: } 241,
{ 119: } 241,
{ 120: } 241,
{ 121: } 247,
{ 122: } 247,
{ 123: } 247,
{ 124: } 247,
{ 125: } 255,
{ 126: } 263,
{ 127: } 271,
{ 128: } 271,
{ 129: } 271,
{ 130: } 271,
{ 131: } 271
);

yygl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 3,
{ 2: } 14,
{ 3: } 14,
{ 4: } 14,
{ 5: } 15,
{ 6: } 16,
{ 7: } 16,
{ 8: } 16,
{ 9: } 17,
{ 10: } 19,
{ 11: } 20,
{ 12: } 21,
{ 13: } 22,
{ 14: } 23,
{ 15: } 23,
{ 16: } 23,
{ 17: } 23,
{ 18: } 23,
{ 19: } 23,
{ 20: } 23,
{ 21: } 23,
{ 22: } 23,
{ 23: } 23,
{ 24: } 23,
{ 25: } 23,
{ 26: } 24,
{ 27: } 27,
{ 28: } 27,
{ 29: } 27,
{ 30: } 27,
{ 31: } 30,
{ 32: } 31,
{ 33: } 31,
{ 34: } 33,
{ 35: } 35,
{ 36: } 37,
{ 37: } 39,
{ 38: } 39,
{ 39: } 39,
{ 40: } 39,
{ 41: } 41,
{ 42: } 46,
{ 43: } 47,
{ 44: } 47,
{ 45: } 47,
{ 46: } 50,
{ 47: } 50,
{ 48: } 50,
{ 49: } 51,
{ 50: } 56,
{ 51: } 61,
{ 52: } 66,
{ 53: } 71,
{ 54: } 71,
{ 55: } 72,
{ 56: } 72,
{ 57: } 72,
{ 58: } 72,
{ 59: } 74,
{ 60: } 75,
{ 61: } 75,
{ 62: } 75,
{ 63: } 76,
{ 64: } 76,
{ 65: } 78,
{ 66: } 78,
{ 67: } 78,
{ 68: } 78,
{ 69: } 78,
{ 70: } 78,
{ 71: } 78,
{ 72: } 83,
{ 73: } 84,
{ 74: } 84,
{ 75: } 85,
{ 76: } 85,
{ 77: } 85,
{ 78: } 85,
{ 79: } 90,
{ 80: } 95,
{ 81: } 100,
{ 82: } 101,
{ 83: } 101,
{ 84: } 101,
{ 85: } 102,
{ 86: } 103,
{ 87: } 103,
{ 88: } 103,
{ 89: } 103,
{ 90: } 107,
{ 91: } 107,
{ 92: } 107,
{ 93: } 107,
{ 94: } 107,
{ 95: } 108,
{ 96: } 108,
{ 97: } 116,
{ 98: } 118,
{ 99: } 118,
{ 100: } 118,
{ 101: } 119,
{ 102: } 119,
{ 103: } 120,
{ 104: } 120,
{ 105: } 121,
{ 106: } 124,
{ 107: } 124,
{ 108: } 124,
{ 109: } 124,
{ 110: } 124,
{ 111: } 124,
{ 112: } 124,
{ 113: } 124,
{ 114: } 124,
{ 115: } 132,
{ 116: } 132,
{ 117: } 132,
{ 118: } 133,
{ 119: } 134,
{ 120: } 135,
{ 121: } 136,
{ 122: } 137,
{ 123: } 137,
{ 124: } 137,
{ 125: } 137,
{ 126: } 141,
{ 127: } 145,
{ 128: } 149,
{ 129: } 149,
{ 130: } 149,
{ 131: } 149
);

yygh : array [0..yynstates-1] of Integer = (
{ 0: } 2,
{ 1: } 13,
{ 2: } 13,
{ 3: } 13,
{ 4: } 14,
{ 5: } 15,
{ 6: } 15,
{ 7: } 15,
{ 8: } 16,
{ 9: } 18,
{ 10: } 19,
{ 11: } 20,
{ 12: } 21,
{ 13: } 22,
{ 14: } 22,
{ 15: } 22,
{ 16: } 22,
{ 17: } 22,
{ 18: } 22,
{ 19: } 22,
{ 20: } 22,
{ 21: } 22,
{ 22: } 22,
{ 23: } 22,
{ 24: } 22,
{ 25: } 23,
{ 26: } 26,
{ 27: } 26,
{ 28: } 26,
{ 29: } 26,
{ 30: } 29,
{ 31: } 30,
{ 32: } 30,
{ 33: } 32,
{ 34: } 34,
{ 35: } 36,
{ 36: } 38,
{ 37: } 38,
{ 38: } 38,
{ 39: } 38,
{ 40: } 40,
{ 41: } 45,
{ 42: } 46,
{ 43: } 46,
{ 44: } 46,
{ 45: } 49,
{ 46: } 49,
{ 47: } 49,
{ 48: } 50,
{ 49: } 55,
{ 50: } 60,
{ 51: } 65,
{ 52: } 70,
{ 53: } 70,
{ 54: } 71,
{ 55: } 71,
{ 56: } 71,
{ 57: } 71,
{ 58: } 73,
{ 59: } 74,
{ 60: } 74,
{ 61: } 74,
{ 62: } 75,
{ 63: } 75,
{ 64: } 77,
{ 65: } 77,
{ 66: } 77,
{ 67: } 77,
{ 68: } 77,
{ 69: } 77,
{ 70: } 77,
{ 71: } 82,
{ 72: } 83,
{ 73: } 83,
{ 74: } 84,
{ 75: } 84,
{ 76: } 84,
{ 77: } 84,
{ 78: } 89,
{ 79: } 94,
{ 80: } 99,
{ 81: } 100,
{ 82: } 100,
{ 83: } 100,
{ 84: } 101,
{ 85: } 102,
{ 86: } 102,
{ 87: } 102,
{ 88: } 102,
{ 89: } 106,
{ 90: } 106,
{ 91: } 106,
{ 92: } 106,
{ 93: } 106,
{ 94: } 107,
{ 95: } 107,
{ 96: } 115,
{ 97: } 117,
{ 98: } 117,
{ 99: } 117,
{ 100: } 118,
{ 101: } 118,
{ 102: } 119,
{ 103: } 119,
{ 104: } 120,
{ 105: } 123,
{ 106: } 123,
{ 107: } 123,
{ 108: } 123,
{ 109: } 123,
{ 110: } 123,
{ 111: } 123,
{ 112: } 123,
{ 113: } 123,
{ 114: } 131,
{ 115: } 131,
{ 116: } 131,
{ 117: } 132,
{ 118: } 133,
{ 119: } 134,
{ 120: } 135,
{ 121: } 136,
{ 122: } 136,
{ 123: } 136,
{ 124: } 136,
{ 125: } 140,
{ 126: } 144,
{ 127: } 148,
{ 128: } 148,
{ 129: } 148,
{ 130: } 148,
{ 131: } 148
);

yyr : array [1..yynrules] of YYRRec = (
{ 1: } ( len: 1; sym: -3 ),
{ 2: } ( len: 1; sym: -4 ),
{ 3: } ( len: 1; sym: -5 ),
{ 4: } ( len: 1; sym: -6 ),
{ 5: } ( len: 1; sym: -7 ),
{ 6: } ( len: 1; sym: -8 ),
{ 7: } ( len: 1; sym: -9 ),
{ 8: } ( len: 1; sym: -10 ),
{ 9: } ( len: 1; sym: -11 ),
{ 10: } ( len: 1; sym: -12 ),
{ 11: } ( len: 1; sym: -13 ),
{ 12: } ( len: 1; sym: -14 ),
{ 13: } ( len: 1; sym: -15 ),
{ 14: } ( len: 1; sym: -16 ),
{ 15: } ( len: 1; sym: -17 ),
{ 16: } ( len: 1; sym: -18 ),
{ 17: } ( len: 1; sym: -19 ),
{ 18: } ( len: 1; sym: -19 ),
{ 19: } ( len: 1; sym: -20 ),
{ 20: } ( len: 1; sym: -21 ),
{ 21: } ( len: 1; sym: -22 ),
{ 22: } ( len: 1; sym: -23 ),
{ 23: } ( len: 1; sym: -24 ),
{ 24: } ( len: 1; sym: -25 ),
{ 25: } ( len: 1; sym: -25 ),
{ 26: } ( len: 1; sym: -26 ),
{ 27: } ( len: 1; sym: -27 ),
{ 28: } ( len: 1; sym: -27 ),
{ 29: } ( len: 1; sym: -28 ),
{ 30: } ( len: 0; sym: -31 ),
{ 31: } ( len: 0; sym: -33 ),
{ 32: } ( len: 6; sym: -2 ),
{ 33: } ( len: 0; sym: -32 ),
{ 34: } ( len: 1; sym: -32 ),
{ 35: } ( len: 0; sym: -29 ),
{ 36: } ( len: 2; sym: -29 ),
{ 37: } ( len: 2; sym: -29 ),
{ 38: } ( len: 2; sym: -34 ),
{ 39: } ( len: 2; sym: -34 ),
{ 40: } ( len: 0; sym: -35 ),
{ 41: } ( len: 3; sym: -34 ),
{ 42: } ( len: 0; sym: -37 ),
{ 43: } ( len: 4; sym: -34 ),
{ 44: } ( len: 0; sym: -39 ),
{ 45: } ( len: 4; sym: -34 ),
{ 46: } ( len: 0; sym: -40 ),
{ 47: } ( len: 4; sym: -34 ),
{ 48: } ( len: 0; sym: -41 ),
{ 49: } ( len: 4; sym: -34 ),
{ 50: } ( len: 3; sym: -34 ),
{ 51: } ( len: 2; sym: -34 ),
{ 52: } ( len: 1; sym: -34 ),
{ 53: } ( len: 1; sym: -34 ),
{ 54: } ( len: 0; sym: -36 ),
{ 55: } ( len: 3; sym: -36 ),
{ 56: } ( len: 1; sym: -38 ),
{ 57: } ( len: 2; sym: -38 ),
{ 58: } ( len: 3; sym: -38 ),
{ 59: } ( len: 1; sym: -38 ),
{ 60: } ( len: 2; sym: -38 ),
{ 61: } ( len: 3; sym: -38 ),
{ 62: } ( len: 1; sym: -43 ),
{ 63: } ( len: 1; sym: -43 ),
{ 64: } ( len: 1; sym: -43 ),
{ 65: } ( len: 2; sym: -43 ),
{ 66: } ( len: 2; sym: -43 ),
{ 67: } ( len: 1; sym: -42 ),
{ 68: } ( len: 2; sym: -42 ),
{ 69: } ( len: 3; sym: -42 ),
{ 70: } ( len: 1; sym: -42 ),
{ 71: } ( len: 2; sym: -42 ),
{ 72: } ( len: 3; sym: -42 ),
{ 73: } ( len: 1; sym: -44 ),
{ 74: } ( len: 0; sym: -46 ),
{ 75: } ( len: 2; sym: -30 ),
{ 76: } ( len: 0; sym: -47 ),
{ 77: } ( len: 0; sym: -48 ),
{ 78: } ( len: 5; sym: -30 ),
{ 79: } ( len: 2; sym: -30 ),
{ 80: } ( len: 1; sym: -30 ),
{ 81: } ( len: 2; sym: -30 ),
{ 82: } ( len: 0; sym: -50 ),
{ 83: } ( len: 0; sym: -52 ),
{ 84: } ( len: 6; sym: -45 ),
{ 85: } ( len: 1; sym: -49 ),
{ 86: } ( len: 0; sym: -54 ),
{ 87: } ( len: 4; sym: -49 ),
{ 88: } ( len: 0; sym: -51 ),
{ 89: } ( len: 2; sym: -51 ),
{ 90: } ( len: 2; sym: -51 ),
{ 91: } ( len: 2; sym: -51 ),
{ 92: } ( len: 2; sym: -51 ),
{ 93: } ( len: 2; sym: -51 ),
{ 94: } ( len: 0; sym: -56 ),
{ 95: } ( len: 3; sym: -55 ),
{ 96: } ( len: 1; sym: -55 ),
{ 97: } ( len: 0; sym: -53 ),
{ 98: } ( len: 0; sym: -58 ),
{ 99: } ( len: 4; sym: -53 ),
{ 100: } ( len: 0; sym: -59 ),
{ 101: } ( len: 4; sym: -53 ),
{ 102: } ( len: 0; sym: -60 ),
{ 103: } ( len: 4; sym: -53 ),
{ 104: } ( len: 2; sym: -53 ),
{ 105: } ( len: 0; sym: -57 ),
{ 106: } ( len: 1; sym: -57 )
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
      yychar := yylex; if yychar<0 then yychar := 0;
    end;

  if yydebug then writeln('state ', yystate, ', char ', yychar);

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
              writeln('error recovery pops state ', yys[yysp], ', uncovers ',
                      yys[yysp-1])
            else
              writeln('error recovery fails ... abort');
          dec(yysp);
        end;
      if yysp=0 then goto abort; (* parser has fallen from stack; abort *)
      yystate := yyn;            (* simulate shift on error *)
      goto parse;
    end
  else                                  (* no shift yet; discard symbol *)
    begin
      if yydebug then writeln('error recovery discards char ', yychar);
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

  if yydebug then writeln('reduce ', -yyn);

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


(* Lexical analyzer (implemented in Turbo Pascal for maximum efficiency): *)

function yylex : integer;
  function end_of_input : boolean;
    begin
      end_of_input := (cno>length(line)) and eof(yyin)
    end(*end_of_input*);
  procedure scan;
    (* scan for nonempty character, skip comments *)
    procedure scan_comment;
      var p : integer;
      begin
        p := pos('*/', copy(line, cno, length(line)));
        if p>0 then
          cno := cno+succ(p)
        else
          begin
            while (p=0) and not eof(yyin) do
              begin
                readln(yyin, line);
                inc(lno);
                p := pos('*/', line)
              end;
            if p=0 then
              begin
                cno := succ(length(line));
                error(open_comment_at_eof);
              end
            else
              cno := succ(succ(p))
          end
      end(*scan_comment*);
    begin
      while not end_of_input do
        if cno<=length(line) then
          case line[cno] of
            ' ', tab : inc(cno);
            '/' :
              if (cno<length(line)) and (line[succ(cno)]='*') then
                begin
                  inc(cno, 2);
                  scan_comment
                end
              else
                exit
            else
              exit
          end
        else
          begin
            readln(yyin, line);
            inc(lno); cno := 1;
          end
    end(*scan*);
  function scan_ident : integer;
    (* scan an identifier *)
    var
      idstr : String;
    begin
      idstr := line[cno];
      inc(cno);
      while (cno<=length(line)) and (
            ('A'<=upCase(line[cno])) and (upCase(line[cno])<='Z') or
            ('0'<=line[cno]) and (line[cno]<='9') or
            (line[cno]='_') or
            (line[cno]='.') ) do
	begin
	  idstr := idstr+line[cno];
	  inc(cno)
	end;
      yylval := get_key(idstr);
      scan;
      if not end_of_input and (line[cno]=':') then
        scan_ident := C_ID
      else
        scan_ident := ID
    end(*scan_ident*);
  function scan_literal: integer;
    (* scan a literal, i.e. string *)
    var
      idstr : String;
      oct_val : Byte;
    begin
      idstr := line[cno];
      inc(cno);
      while (cno<=length(line)) and (line[cno]<>idstr[1]) do
        if line[cno]='\' then
          if cno<length(line) then
            begin
              inc(cno);
              case line[cno] of
                'n' :
                  begin
                    idstr := idstr+nl;
                    inc(cno)
                  end;
                'r' :
                  begin
                    idstr := idstr+cr;
                    inc(cno)
                  end;
                't' :
                  begin
                    idstr := idstr+tab;
                    inc(cno)
                  end;
                'b' :
                  begin
                    idstr := idstr+bs;
                    inc(cno)
                  end;
                'f' :
                  begin
                    idstr := idstr+ff;
                    inc(cno)
                  end;
                '0'..'7' :
                  begin
                    oct_val := ord(line[cno])-ord('0');
                    inc(cno);
                    while (cno<=length(line)) and
                          ('0'<=line[cno]) and
                          (line[cno]<='7') do
                      begin
                        oct_val := oct_val*8+ord(line[cno])-ord('0');
                        inc(cno)
                      end;
                    idstr := idstr+chr(oct_val)
                  end
                else
                  begin
                    idstr := idstr+line[cno];
                    inc(cno)
                  end
              end
            end
          else
            inc(cno)
        else
          begin
            idstr := idstr+line[cno];
            inc(cno)
          end;
      if cno>length(line) then
        error(missing_string_terminator)
      else
        inc(cno);
      if length(idstr)=2 then
        begin
          yylval := ord(idstr[2]);
          scan_literal := LITERAL;
        end
      else if length(idstr)>1 then
        begin
          yylval := get_key(''''+copy(idstr, 2, pred(length(idstr)))+'''');
          scan_literal := LITID;
        end
      else
        scan_literal := ILLEGAL;
    end(*scan_literal*);
  function scan_num : integer;
    (* scan an unsigned integer *)
    var
      numstr : String;
      code : integer;
    begin
      numstr := line[cno];
      inc(cno);
      while (cno<=length(line)) and
            ('0'<=line[cno]) and (line[cno]<='9') do
        begin
          numstr := numstr+line[cno];
          inc(cno)
        end;
      val(numstr, yylval, code);
      if code=0 then
        scan_num := NUMBER
      else
        scan_num := ILLEGAL;
    end(*scan_num*);
  function scan_keyword : integer;
    (* scan %xy *)
    function lookup(key : String; var tok : integer) : boolean;
      (* table of Yacc keywords (unstropped): *)
      const
        no_of_entries = 13;
        max_entry_length = 9;
        keys : array [1..no_of_entries] of String[max_entry_length] = (
          '0', '2', 'binary', 'left', 'nonassoc', 'prec', 'right',
          'start', 'term', 'token', 'type', 'classname', 'classdef');
        toks : array [1..no_of_entries] of integer = (
          PTOKEN, PNONASSOC, PNONASSOC, PLEFT, PNONASSOC, PPREC, PRIGHT,
          PSTART, PTOKEN, PTOKEN, PTYPE, PCLASSNAME, PCLASSDEF);
      var m, n, k : integer;
      begin
        (* binary search: *)
        m := 1; n := no_of_entries;
        lookup := true;
        while m<=n do
          begin
            k := m+(n-m) div 2;
            if key=keys[k] then
              begin
                tok := toks[k];
                exit
              end
            else if key>keys[k] then
              m := k+1
            else
              n := k-1
          end;
        lookup := false
      end(*lookup*);
    var
      keywstr : String;
      trail: String;
      tok : integer;
    begin
      inc(cno);
      if cno<=length(line) then
        case line[cno] of
          '<' :
            begin
              scan_keyword := PLEFT;
              inc(cno)
            end;
          '>' :
            begin
              scan_keyword := PRIGHT;
              inc(cno)
            end;
          '=' :
            begin
              scan_keyword := PPREC;
              inc(cno)
            end;
          '%', '\' :
            begin
              scan_keyword := PP;
              inc(cno)
            end;
          '{' :
            begin
              scan_keyword := LCURL;
              inc(cno)
            end;
          '}' :
            begin
              scan_keyword := RCURL;
              inc(cno)
            end;
          'A'..'Z', 'a'..'z', '0'..'9' :
            begin
              keywstr := line[cno];
              inc(cno);
              while (cno<=length(line)) and (
                    ('A'<=upCase(line[cno])) and (upCase(line[cno])<='Z') or
                    ('0'<=line[cno]) and (line[cno]<='Z') ) do
                begin
                  keywstr := keywstr+line[cno];
                  inc(cno)
                end;
              if lookup(keywstr, tok) then
              begin
                scan_keyword := tok;
                if (scan_keyword = PCLASSNAME) or (scan_keyword = PCLASSDEF) then
                begin
                  if object_oriented then
                  begin
                    trail := Copy(line, cno, Length(Line) { will trunc });
                    if (scan_keyword = PCLASSNAME) then
                    begin
                      trail := Trim(trail);
                      if SetClassName(trail) <> 0 then
                        scan_keyword := ILLEGAL;
                    end
                    else
                    begin
                      if AddClassDef(trail) <> 0 then
                        scan_keyword := ILLEGAL;
                    end;
                  end
                  else
                    scan_keyword := ILLEGAL;
                end
              end
              else
                scan_keyword := ILLEGAL
            end;
          else scan_keyword := ILLEGAL
        end
      else
        scan_keyword := ILLEGAL;
    end(*scan_keyword*);
  function scan_char : integer;
    (* scan any single character *)
    begin
      scan_char := ord(line[cno]);
      inc(cno)
    end(*scan_char*);
  var lno0, cno0 : integer;
  begin
    tokleng := 0;
    scan;
    lno0 := lno; cno0 := cno;
    if end_of_input then
      yylex := 0
    else
      case line[cno] of
        'A'..'Z', 'a'..'z', '_' : yylex := scan_ident;
	'''', '"' : yylex := scan_literal;
	'0'..'9' : yylex := scan_num;
	'%', '\' : yylex := scan_keyword;
        '=' :
          if (cno<length(line)) and (line[succ(cno)]='{') then
            begin
              inc(cno);
              yylex := scan_char
            end
          else
            yylex := scan_char;
	else yylex := scan_char;
      end;
    if lno=lno0 then
      tokleng := cno-cno0
  end(*yylex*);

(* Main program: *)

var i : Integer;

begin
  try
{$ifdef linux}
  codfilepath:='/usr/lib/fpc/lexyacc/';
{$else}
  codfilepath:=path(paramstr(0));
{$endif}

  (* sign-on: *)

  writeln(sign_on);

  (* parse command line: *)

  if paramCount=0 then
    begin
      writeln(usage);
      writeln(options);
      halt(0);
    end;

  yfilename := '';
  pasfilename := '';

  for i := 1 to paramCount do
    if copy(paramStr(i), 1, 1)='-' then
      if upper(paramStr(i))='-OO' then
        object_oriented := true
      else if upper(paramStr(i))='-V' then
        verbose := true
      else if upper(paramStr(i))='-D' then
        debug := true
      else
        begin
          writeln(invalid_option, paramStr(i));
          halt(1);
        end
    else if yfilename='' then
      yfilename := addExt(paramStr(i), 'y')
    else if pasfilename='' then
      pasfilename := addExt(paramStr(i), 'pas')
    else if lstfilename='' then
      lstfilename := addExt(paramStr(i), 'lst')
    else
      begin
        writeln(illegal_no_args);
        halt(1);
      end;

  if yfilename='' then
    begin
      writeln(illegal_no_args);
      halt(1);
    end;

  if pasfilename='' then pasfilename := root(yfilename)+'.pas';
  if lstfilename='' then lstfilename := root(yfilename)+'.lst';

  (* open files: *)

  assign(yyin, yfilename);
  assign(yyout, pasfilename);
  assign(yylst, lstfilename);

  reset(yyin);    if ioresult<>0 then fatal(cannot_open_file+yfilename);
  rewrite(yyout); if ioresult<>0 then fatal(cannot_open_file+pasfilename);
  rewrite(yylst); if ioresult<>0 then fatal(cannot_open_file+lstfilename);

  (* search code template in current directory, then on path where Yacc
     was executed from: *)
  if object_oriented then
    codfilename := codfilepath + 'yyparse.cod'
  else
    codfilename := codfilepath + 'yyparse_oo.cod';
  assign(yycod, codfilename);
  reset(yycod);
  if ioresult<>0 then
    begin
      if object_oriented then
        codfilename := codfilepath+'..\..\yyparse_oo.cod'
      else
        codfilename := codfilepath+'..\..\yyparse.cod';

      assign(yycod, codfilename);
      reset(yycod);
      if ioresult<>0 then fatal(cannot_open_file+codfilename);
    end;

  (* parse source grammar: *)

  writeln('parse ... ');

  lno := 0; cno := 1; line := '';

  next_section;
  if debug then writeln(yyout, '{$define yydebug}');

  if yyparse=0 then
    { done }
  else if yychar=0 then
    error(unexpected_eof)
  else
    error(syntax_error);

  if errors=0 then writeln('DONE');

  (* close files: *)

  close(yyin); close(yyout); close(yylst); close(yycod);

  (* print statistics: *)

  if undefined_nt > 0 then
    writeln(undefined_nt, ' undefined nonterminals.');
  if errors>0 then
    writeln( lno, ' lines, ',
             errors, ' errors found.' )
  else
    begin
      writeln( lno, ' lines, ',
               n_rules-1, '/', max_rules-1, ' rules, ',
               n_states, '/', max_states, ' s, ',
               n_items, '/', max_items, ' i, ',
               n_trans, '/', max_trans, ' t, ',
               n_redns, '/', max_redns, ' r.');
      if shift_reduce>0 then
        writeln(shift_reduce, ' shift/reduce conflicts.');
      if reduce_reduce>0 then
        writeln(reduce_reduce, ' reduce/reduce conflicts.');
      if never_reduced>0 then
        writeln(never_reduced, ' rules never reduced.');
    end;

  if warnings>0 then writeln(warnings, ' warnings.');

{$ifndef fpc}
{$IFNDEF Win32}
  writeln( n_bytes, '/', max_bytes, ' bytes of memory used.');
{$ENDIF}
{$endif}

  (* terminate: *)

  if errors>0 then
    begin
      erase(yyout);
      if ioresult<>0 then ;
    end;

  if file_size(lstfilename)=0 then
    erase(yylst)
  else
    writeln('(see ', lstfilename, ' for more information)');

  halt(errors);
  except
    on E: exception do
    begin
      writeln(E.Message);
      raise;
    end;
  end;
end(*Yacc*).