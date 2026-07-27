
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
  YaccLib, YaccBase, YaccMsgs, YaccSem, YaccTabl, YaccPars, YaccClassDefs;

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
const PCLASSVAR = 270;
const PCLASSFUNC = 271;
const PP = 272;
const LCURL = 273;
const RCURL = 274;
const ILLEGAL = 275;
{.cod}

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
         yyerrok; 
       end;
  15 : begin
         yyval := yyv[yysp-0];
       end;
  16 : begin
         yyerrok; 
       end;
  17 : begin
         yyval := yyv[yysp-0];
       end;
  18 : begin
         yyval := yyv[yysp-0];
       end;
  19 : begin
         error(rcurl_expected); 
       end;
  20 : begin
         yyval := yyv[yysp-0];
       end;
  21 : begin
         yyerrok; 
       end;
  22 : begin
         yyerrok; 
       end;
  23 : begin
         yyerrok; 
       end;
  24 : begin
         yyval := yyv[yysp-0];
       end;
  25 : begin
         yyval := yyv[yysp-0];
       end;
  26 : begin
         error(rbrace_expected); 
       end;
  27 : begin
         yyval := yyv[yysp-0];
       end;
  28 : begin
         yyval := yyv[yysp-0];
       end;
  29 : begin
         error(rangle_expected); 
       end;
  30 : begin
         yyval := yyv[yysp-0];
       end;
  31 : begin
         sort_types;
         definitions;
         oo_def;
         oo_classvars;
         writeln(yyout, '{.cod}');
         next_section;
         oo_classfuncs;
         oo_impl; 
       end;
  32 : begin
         next_section;
         generate_parser;
         next_section; 
       end;
  33 : begin
         yyval := yyv[yysp-5];
       end;
  34 : begin
       end;
  35 : begin
         copy_rest_of_file; 
       end;
  36 : begin
       end;
  37 : begin
         yyerrok; 
       end;
  38 : begin
         error(error_in_def); 
       end;
  39 : begin
         startnt := ntsym(yyv[yysp-0]); 
       end;
  40 : begin
         error(ident_expected); 
       end;
  41 : begin
         copy_code; 
       end;
  42 : begin
         yyval := yyv[yysp-2];
       end;
  43 : begin
         act_prec := 0; 
       end;
  44 : begin
         yyval := yyv[yysp-3];
       end;
  45 : begin
         act_prec := new_prec_level(left); 
       end;
  46 : begin
         yyval := yyv[yysp-3];
       end;
  47 : begin
         act_prec := new_prec_level(right); 
       end;
  48 : begin
         yyval := yyv[yysp-3];
       end;
  49 : begin
         act_prec := new_prec_level(nonassoc); 
       end;
  50 : begin
         yyval := yyv[yysp-3];
       end;
  51 : begin
         yyval := yyv[yysp-2];
       end;
  52 : begin
         yyval := yyv[yysp-1];
       end;
  53 : begin
         (* Rely on custom lexer to add classname *) 
       end;
  54 : begin
         (* Rely on custom lexer to add classvar *) 
       end;
  55 : begin
         (* Rely on custom lexer to add classfunc *) 
       end;
  56 : begin
         act_type := 0; 
       end;
  57 : begin
         act_type := yyv[yysp-1]; add_type(yyv[yysp-1]); 
       end;
  58 : begin
         yyval := yyv[yysp-0];
       end;
  59 : begin
         yyerrok; 
       end;
  60 : begin
         yyerrok; 
       end;
  61 : begin
         error(ident_expected); 
       end;
  62 : begin
         error(error_in_def); 
       end;
  63 : begin
         error(ident_expected); 
       end;
  64 : begin
         if act_type<>0 then
         sym_type^[yyv[yysp-0]] := act_type;
         if act_prec<>0 then
         sym_prec^[yyv[yysp-0]] := act_prec; 
       end;
  65 : begin
         litsym(yyv[yysp-0], 0);
         if act_type<>0 then
         sym_type^[litsym(yyv[yysp-0], 0)] := act_type;
         if act_prec<>0 then
         sym_prec^[litsym(yyv[yysp-0], 0)] := act_prec; 
       end;
  66 : begin
         litsym(yyv[yysp-0], 0);
         if act_type<>0 then
         sym_type^[litsym(yyv[yysp-0], 0)] := act_type;
         if act_prec<>0 then
         sym_prec^[litsym(yyv[yysp-0], 0)] := act_prec; 
       end;
  67 : begin
         litsym(yyv[yysp-1], 0);
         if act_type<>0 then
         sym_type^[litsym(yyv[yysp-1], yyv[yysp-0])] := act_type;
         if act_prec<>0 then
         sym_prec^[litsym(yyv[yysp-1], 0)]  := act_prec; 
       end;
  68 : begin
         litsym(yyv[yysp-1], 0);
         if act_type<>0 then
         sym_type^[litsym(yyv[yysp-1], yyv[yysp-0])] := act_type;
         if act_prec<>0 then
         sym_prec^[litsym(yyv[yysp-1], 0)]  := act_prec; 
       end;
  69 : begin
         yyval := yyv[yysp-0];
       end;
  70 : begin
         yyerrok; 
       end;
  71 : begin
         yyerrok; 
       end;
  72 : begin
         error(ident_expected); 
       end;
  73 : begin
         error(error_in_def); 
       end;
  74 : begin
         error(ident_expected); 
       end;
  75 : begin
         if act_type<>0 then
         sym_type^[ntsym(yyv[yysp-0])] := act_type; 
       end;
  76 : begin
         next_section; 
       end;
  77 : begin
         yyval := yyv[yysp-1];
       end;
  78 : begin
         copy_code; 
       end;
  79 : begin
         next_section; 
       end;
  80 : begin
         yyval := yyv[yysp-4];
       end;
  81 : begin
         yyerrok; 
       end;
  82 : begin
         error(error_in_rule); 
       end;
  83 : begin
         error(error_in_rule); 
       end;
  84 : begin
         start_rule(ntsym(yyv[yysp-0])); 
       end;
  85 : begin
         start_body; 
       end;
  86 : begin
         end_body; 
       end;
  87 : begin
         yyval := yyv[yysp-0];
       end;
  88 : begin
         start_body; 
       end;
  89 : begin
         end_body; 
       end;
  90 : begin
       end;
  91 : begin
         add_symbol(yyv[yysp-0]); yyerrok; 
       end;
  92 : begin
         add_symbol(sym(yyv[yysp-0])); yyerrok; 
       end;
  93 : begin
         add_symbol(sym(yyv[yysp-0])); yyerrok; 
       end;
  94 : begin
         add_action; yyerrok; 
       end;
  95 : begin
         error(error_in_rule); 
       end;
  96 : begin
         copy_action; 
       end;
  97 : begin
         yyval := yyv[yysp-2];
       end;
  98 : begin
         copy_single_action; 
       end;
  99 : begin
       end;
 100 : begin
         add_rule_prec(yyv[yysp-0]); 
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
         add_rule_prec(litsym(yyv[yysp-0], 0)); 
       end;
 105 : begin
         yyval := yyv[yysp-3];
       end;
 106 : begin
         yyval := yyv[yysp-1];
       end;
 107 : begin
       end;
 108 : begin
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

yynacts   = 281;
yyngotos  = 149;
yynstates = 134;
yynrules  = 108;

yya : array [1..yynacts] of YYARec = (
{ 0: }
{ 1: }
  ( sym: 256; act: 15 ),
  ( sym: 262; act: 16 ),
  ( sym: 263; act: 17 ),
  ( sym: 264; act: 18 ),
  ( sym: 265; act: 19 ),
  ( sym: 266; act: 20 ),
  ( sym: 267; act: 21 ),
  ( sym: 269; act: 22 ),
  ( sym: 270; act: 23 ),
  ( sym: 271; act: 24 ),
  ( sym: 272; act: 25 ),
  ( sym: 273; act: 26 ),
{ 2: }
  ( sym: 0; act: 0 ),
{ 3: }
{ 4: }
{ 5: }
{ 6: }
{ 7: }
{ 8: }
{ 9: }
  ( sym: 256; act: 30 ),
  ( sym: 257; act: 31 ),
{ 10: }
  ( sym: 60; act: 34 ),
  ( sym: 256; act: -56 ),
  ( sym: 257; act: -56 ),
  ( sym: 262; act: -56 ),
  ( sym: 263; act: -56 ),
  ( sym: 264; act: -56 ),
  ( sym: 265; act: -56 ),
  ( sym: 266; act: -56 ),
  ( sym: 267; act: -56 ),
  ( sym: 269; act: -56 ),
  ( sym: 270; act: -56 ),
  ( sym: 271; act: -56 ),
  ( sym: 272; act: -56 ),
  ( sym: 273; act: -56 ),
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
{ 26: }
{ 27: }
  ( sym: 256; act: 40 ),
  ( sym: 274; act: 41 ),
{ 28: }
  ( sym: 256; act: 45 ),
  ( sym: 273; act: 26 ),
  ( sym: 258; act: -76 ),
{ 29: }
{ 30: }
{ 31: }
{ 32: }
  ( sym: 256; act: 49 ),
  ( sym: 257; act: 31 ),
  ( sym: 262; act: -52 ),
  ( sym: 263; act: -52 ),
  ( sym: 264; act: -52 ),
  ( sym: 265; act: -52 ),
  ( sym: 266; act: -52 ),
  ( sym: 267; act: -52 ),
  ( sym: 269; act: -52 ),
  ( sym: 270; act: -52 ),
  ( sym: 271; act: -52 ),
  ( sym: 272; act: -52 ),
  ( sym: 273; act: -52 ),
{ 33: }
  ( sym: 257; act: 31 ),
{ 34: }
{ 35: }
  ( sym: 60; act: 34 ),
  ( sym: 256; act: -56 ),
  ( sym: 257; act: -56 ),
  ( sym: 259; act: -56 ),
  ( sym: 260; act: -56 ),
{ 36: }
  ( sym: 60; act: 34 ),
  ( sym: 256; act: -56 ),
  ( sym: 257; act: -56 ),
  ( sym: 259; act: -56 ),
  ( sym: 260; act: -56 ),
{ 37: }
  ( sym: 60; act: 34 ),
  ( sym: 256; act: -56 ),
  ( sym: 257; act: -56 ),
  ( sym: 259; act: -56 ),
  ( sym: 260; act: -56 ),
{ 38: }
  ( sym: 60; act: 34 ),
  ( sym: 256; act: -56 ),
  ( sym: 257; act: -56 ),
  ( sym: 259; act: -56 ),
  ( sym: 260; act: -56 ),
{ 39: }
{ 40: }
{ 41: }
{ 42: }
  ( sym: 258; act: 57 ),
{ 43: }
  ( sym: 124; act: 62 ),
  ( sym: 256; act: 63 ),
  ( sym: 258; act: 57 ),
  ( sym: 0; act: -32 ),
  ( sym: 272; act: -32 ),
{ 44: }
{ 45: }
{ 46: }
{ 47: }
  ( sym: 44; act: 67 ),
  ( sym: 256; act: 68 ),
  ( sym: 257; act: 31 ),
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
  ( sym: 273; act: -51 ),
{ 48: }
{ 49: }
{ 50: }
  ( sym: 62; act: 70 ),
  ( sym: 256; act: 71 ),
{ 51: }
  ( sym: 256; act: 77 ),
  ( sym: 257; act: 31 ),
  ( sym: 259; act: 78 ),
  ( sym: 260; act: 79 ),
{ 52: }
  ( sym: 256; act: 77 ),
  ( sym: 257; act: 31 ),
  ( sym: 259; act: 78 ),
  ( sym: 260; act: 79 ),
{ 53: }
  ( sym: 256; act: 77 ),
  ( sym: 257; act: 31 ),
  ( sym: 259; act: 78 ),
  ( sym: 260; act: 79 ),
{ 54: }
  ( sym: 256; act: 77 ),
  ( sym: 257; act: 31 ),
  ( sym: 259; act: 78 ),
  ( sym: 260; act: 79 ),
{ 55: }
{ 56: }
{ 57: }
{ 58: }
{ 59: }
{ 60: }
  ( sym: 272; act: 25 ),
  ( sym: 0; act: -34 ),
{ 61: }
{ 62: }
{ 63: }
{ 64: }
  ( sym: 256; act: 40 ),
  ( sym: 274; act: 41 ),
{ 65: }
{ 66: }
  ( sym: 256; act: 89 ),
  ( sym: 257; act: 31 ),
{ 67: }
{ 68: }
{ 69: }
{ 70: }
{ 71: }
{ 72: }
{ 73: }
  ( sym: 44; act: 67 ),
  ( sym: 256; act: 92 ),
  ( sym: 257; act: 31 ),
  ( sym: 259; act: 78 ),
  ( sym: 260; act: 79 ),
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
  ( sym: 273; act: -50 ),
{ 74: }
  ( sym: 261; act: 94 ),
  ( sym: 44; act: -65 ),
  ( sym: 256; act: -65 ),
  ( sym: 257; act: -65 ),
  ( sym: 259; act: -65 ),
  ( sym: 260; act: -65 ),
  ( sym: 262; act: -65 ),
  ( sym: 263; act: -65 ),
  ( sym: 264; act: -65 ),
  ( sym: 265; act: -65 ),
  ( sym: 266; act: -65 ),
  ( sym: 267; act: -65 ),
  ( sym: 269; act: -65 ),
  ( sym: 270; act: -65 ),
  ( sym: 271; act: -65 ),
  ( sym: 272; act: -65 ),
  ( sym: 273; act: -65 ),
{ 75: }
{ 76: }
  ( sym: 261; act: 94 ),
  ( sym: 44; act: -66 ),
  ( sym: 256; act: -66 ),
  ( sym: 257; act: -66 ),
  ( sym: 259; act: -66 ),
  ( sym: 260; act: -66 ),
  ( sym: 262; act: -66 ),
  ( sym: 263; act: -66 ),
  ( sym: 264; act: -66 ),
  ( sym: 265; act: -66 ),
  ( sym: 266; act: -66 ),
  ( sym: 267; act: -66 ),
  ( sym: 269; act: -66 ),
  ( sym: 270; act: -66 ),
  ( sym: 271; act: -66 ),
  ( sym: 272; act: -66 ),
  ( sym: 273; act: -66 ),
{ 77: }
{ 78: }
{ 79: }
{ 80: }
  ( sym: 44; act: 67 ),
  ( sym: 256; act: 92 ),
  ( sym: 257; act: 31 ),
  ( sym: 259; act: 78 ),
  ( sym: 260; act: 79 ),
  ( sym: 262; act: -48 ),
  ( sym: 263; act: -48 ),
  ( sym: 264; act: -48 ),
  ( sym: 265; act: -48 ),
  ( sym: 266; act: -48 ),
  ( sym: 267; act: -48 ),
  ( sym: 269; act: -48 ),
  ( sym: 270; act: -48 ),
  ( sym: 271; act: -48 ),
  ( sym: 272; act: -48 ),
  ( sym: 273; act: -48 ),
{ 81: }
  ( sym: 44; act: 67 ),
  ( sym: 256; act: 92 ),
  ( sym: 257; act: 31 ),
  ( sym: 259; act: 78 ),
  ( sym: 260; act: 79 ),
  ( sym: 262; act: -46 ),
  ( sym: 263; act: -46 ),
  ( sym: 264; act: -46 ),
  ( sym: 265; act: -46 ),
  ( sym: 266; act: -46 ),
  ( sym: 267; act: -46 ),
  ( sym: 269; act: -46 ),
  ( sym: 270; act: -46 ),
  ( sym: 271; act: -46 ),
  ( sym: 272; act: -46 ),
  ( sym: 273; act: -46 ),
{ 82: }
  ( sym: 44; act: 67 ),
  ( sym: 256; act: 92 ),
  ( sym: 257; act: 31 ),
  ( sym: 259; act: 78 ),
  ( sym: 260; act: 79 ),
  ( sym: 262; act: -44 ),
  ( sym: 263; act: -44 ),
  ( sym: 264; act: -44 ),
  ( sym: 265; act: -44 ),
  ( sym: 266; act: -44 ),
  ( sym: 267; act: -44 ),
  ( sym: 269; act: -44 ),
  ( sym: 270; act: -44 ),
  ( sym: 271; act: -44 ),
  ( sym: 272; act: -44 ),
  ( sym: 273; act: -44 ),
{ 83: }
  ( sym: 58; act: 97 ),
{ 84: }
{ 85: }
{ 86: }
{ 87: }
{ 88: }
{ 89: }
{ 90: }
{ 91: }
  ( sym: 256; act: 101 ),
  ( sym: 257; act: 31 ),
  ( sym: 259; act: 78 ),
  ( sym: 260; act: 79 ),
{ 92: }
{ 93: }
{ 94: }
{ 95: }
{ 96: }
{ 97: }
{ 98: }
  ( sym: 61; act: 111 ),
  ( sym: 123; act: 112 ),
  ( sym: 256; act: 113 ),
  ( sym: 257; act: 31 ),
  ( sym: 259; act: 78 ),
  ( sym: 260; act: 79 ),
  ( sym: 268; act: 114 ),
  ( sym: 0; act: -99 ),
  ( sym: 59; act: -99 ),
  ( sym: 124; act: -99 ),
  ( sym: 258; act: -99 ),
  ( sym: 272; act: -99 ),
{ 99: }
  ( sym: 258; act: 57 ),
{ 100: }
{ 101: }
{ 102: }
{ 103: }
{ 104: }
  ( sym: 59; act: 118 ),
  ( sym: 0; act: -89 ),
  ( sym: 124; act: -89 ),
  ( sym: 256; act: -89 ),
  ( sym: 258; act: -89 ),
  ( sym: 272; act: -89 ),
{ 105: }
{ 106: }
{ 107: }
  ( sym: 257; act: 31 ),
  ( sym: 259; act: 78 ),
  ( sym: 260; act: 79 ),
{ 108: }
{ 109: }
{ 110: }
{ 111: }
{ 112: }
{ 113: }
{ 114: }
{ 115: }
{ 116: }
  ( sym: 61; act: 111 ),
  ( sym: 123; act: 112 ),
  ( sym: 256; act: 113 ),
  ( sym: 257; act: 31 ),
  ( sym: 259; act: 78 ),
  ( sym: 260; act: 79 ),
  ( sym: 268; act: 114 ),
  ( sym: 0; act: -99 ),
  ( sym: 59; act: -99 ),
  ( sym: 124; act: -99 ),
  ( sym: 258; act: -99 ),
  ( sym: 272; act: -99 ),
{ 117: }
{ 118: }
{ 119: }
  ( sym: 125; act: 125 ),
  ( sym: 256; act: 126 ),
{ 120: }
{ 121: }
{ 122: }
{ 123: }
  ( sym: 59; act: 118 ),
  ( sym: 0; act: -86 ),
  ( sym: 124; act: -86 ),
  ( sym: 256; act: -86 ),
  ( sym: 258; act: -86 ),
  ( sym: 272; act: -86 ),
{ 124: }
{ 125: }
{ 126: }
{ 127: }
  ( sym: 61; act: 111 ),
  ( sym: 123; act: 112 ),
  ( sym: 0; act: -107 ),
  ( sym: 59; act: -107 ),
  ( sym: 124; act: -107 ),
  ( sym: 256; act: -107 ),
  ( sym: 258; act: -107 ),
  ( sym: 272; act: -107 ),
{ 128: }
  ( sym: 61; act: 111 ),
  ( sym: 123; act: 112 ),
  ( sym: 0; act: -107 ),
  ( sym: 59; act: -107 ),
  ( sym: 124; act: -107 ),
  ( sym: 256; act: -107 ),
  ( sym: 258; act: -107 ),
  ( sym: 272; act: -107 ),
{ 129: }
  ( sym: 61; act: 111 ),
  ( sym: 123; act: 112 ),
  ( sym: 0; act: -107 ),
  ( sym: 59; act: -107 ),
  ( sym: 124; act: -107 ),
  ( sym: 256; act: -107 ),
  ( sym: 258; act: -107 ),
  ( sym: 272; act: -107 )
{ 130: }
{ 131: }
{ 132: }
{ 133: }
);

yyg : array [1..yyngotos] of YYARec = (
{ 0: }
  ( sym: -30; act: 1 ),
  ( sym: -2; act: 2 ),
{ 1: }
  ( sym: -35; act: 3 ),
  ( sym: -19; act: 4 ),
  ( sym: -18; act: 5 ),
  ( sym: -16; act: 6 ),
  ( sym: -15; act: 7 ),
  ( sym: -14; act: 8 ),
  ( sym: -13; act: 9 ),
  ( sym: -12; act: 10 ),
  ( sym: -11; act: 11 ),
  ( sym: -10; act: 12 ),
  ( sym: -9; act: 13 ),
  ( sym: -8; act: 14 ),
{ 2: }
{ 3: }
{ 4: }
  ( sym: -36; act: 27 ),
{ 5: }
  ( sym: -32; act: 28 ),
{ 6: }
{ 7: }
{ 8: }
{ 9: }
  ( sym: -3; act: 29 ),
{ 10: }
  ( sym: -37; act: 32 ),
  ( sym: -27; act: 33 ),
{ 11: }
  ( sym: -42; act: 35 ),
{ 12: }
  ( sym: -41; act: 36 ),
{ 13: }
  ( sym: -40; act: 37 ),
{ 14: }
  ( sym: -38; act: 38 ),
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
{ 26: }
{ 27: }
  ( sym: -20; act: 39 ),
{ 28: }
  ( sym: -47; act: 42 ),
  ( sym: -31; act: 43 ),
  ( sym: -19; act: 44 ),
{ 29: }
{ 30: }
{ 31: }
{ 32: }
  ( sym: -45; act: 46 ),
  ( sym: -43; act: 47 ),
  ( sym: -3; act: 48 ),
{ 33: }
  ( sym: -3; act: 50 ),
{ 34: }
{ 35: }
  ( sym: -37; act: 51 ),
  ( sym: -27; act: 33 ),
{ 36: }
  ( sym: -37; act: 52 ),
  ( sym: -27; act: 33 ),
{ 37: }
  ( sym: -37; act: 53 ),
  ( sym: -27; act: 33 ),
{ 38: }
  ( sym: -37; act: 54 ),
  ( sym: -27; act: 33 ),
{ 39: }
{ 40: }
{ 41: }
{ 42: }
  ( sym: -46; act: 55 ),
  ( sym: -4; act: 56 ),
{ 43: }
  ( sym: -50; act: 58 ),
  ( sym: -46; act: 59 ),
  ( sym: -34; act: 60 ),
  ( sym: -24; act: 61 ),
  ( sym: -4; act: 56 ),
{ 44: }
  ( sym: -48; act: 64 ),
{ 45: }
{ 46: }
{ 47: }
  ( sym: -45; act: 65 ),
  ( sym: -21; act: 66 ),
  ( sym: -3; act: 48 ),
{ 48: }
{ 49: }
{ 50: }
  ( sym: -28; act: 69 ),
{ 51: }
  ( sym: -44; act: 72 ),
  ( sym: -39; act: 73 ),
  ( sym: -6; act: 74 ),
  ( sym: -5; act: 75 ),
  ( sym: -3; act: 76 ),
{ 52: }
  ( sym: -44; act: 72 ),
  ( sym: -39; act: 80 ),
  ( sym: -6; act: 74 ),
  ( sym: -5; act: 75 ),
  ( sym: -3; act: 76 ),
{ 53: }
  ( sym: -44; act: 72 ),
  ( sym: -39; act: 81 ),
  ( sym: -6; act: 74 ),
  ( sym: -5; act: 75 ),
  ( sym: -3; act: 76 ),
{ 54: }
  ( sym: -44; act: 72 ),
  ( sym: -39; act: 82 ),
  ( sym: -6; act: 74 ),
  ( sym: -5; act: 75 ),
  ( sym: -3; act: 76 ),
{ 55: }
{ 56: }
  ( sym: -51; act: 83 ),
{ 57: }
{ 58: }
{ 59: }
{ 60: }
  ( sym: -33; act: 84 ),
  ( sym: -18; act: 85 ),
{ 61: }
  ( sym: -55; act: 86 ),
{ 62: }
{ 63: }
{ 64: }
  ( sym: -20; act: 87 ),
{ 65: }
{ 66: }
  ( sym: -45; act: 88 ),
  ( sym: -3; act: 48 ),
{ 67: }
{ 68: }
{ 69: }
{ 70: }
{ 71: }
{ 72: }
{ 73: }
  ( sym: -44; act: 90 ),
  ( sym: -21; act: 91 ),
  ( sym: -6; act: 74 ),
  ( sym: -5; act: 75 ),
  ( sym: -3; act: 76 ),
{ 74: }
  ( sym: -7; act: 93 ),
{ 75: }
{ 76: }
  ( sym: -7; act: 95 ),
{ 77: }
{ 78: }
{ 79: }
{ 80: }
  ( sym: -44; act: 90 ),
  ( sym: -21; act: 91 ),
  ( sym: -6; act: 74 ),
  ( sym: -5; act: 75 ),
  ( sym: -3; act: 76 ),
{ 81: }
  ( sym: -44; act: 90 ),
  ( sym: -21; act: 91 ),
  ( sym: -6; act: 74 ),
  ( sym: -5; act: 75 ),
  ( sym: -3; act: 76 ),
{ 82: }
  ( sym: -44; act: 90 ),
  ( sym: -21; act: 91 ),
  ( sym: -6; act: 74 ),
  ( sym: -5; act: 75 ),
  ( sym: -3; act: 76 ),
{ 83: }
  ( sym: -22; act: 96 ),
{ 84: }
{ 85: }
{ 86: }
  ( sym: -52; act: 98 ),
{ 87: }
  ( sym: -49; act: 99 ),
{ 88: }
{ 89: }
{ 90: }
{ 91: }
  ( sym: -44; act: 100 ),
  ( sym: -6; act: 74 ),
  ( sym: -5; act: 75 ),
  ( sym: -3; act: 76 ),
{ 92: }
{ 93: }
{ 94: }
{ 95: }
{ 96: }
  ( sym: -53; act: 102 ),
{ 97: }
{ 98: }
  ( sym: -56; act: 103 ),
  ( sym: -54; act: 104 ),
  ( sym: -29; act: 105 ),
  ( sym: -25; act: 106 ),
  ( sym: -17; act: 107 ),
  ( sym: -6; act: 108 ),
  ( sym: -5; act: 109 ),
  ( sym: -3; act: 110 ),
{ 99: }
  ( sym: -46; act: 115 ),
  ( sym: -4; act: 56 ),
{ 100: }
{ 101: }
{ 102: }
  ( sym: -52; act: 116 ),
{ 103: }
{ 104: }
  ( sym: -23; act: 117 ),
{ 105: }
{ 106: }
  ( sym: -57; act: 119 ),
{ 107: }
  ( sym: -6; act: 120 ),
  ( sym: -5; act: 121 ),
  ( sym: -3; act: 122 ),
{ 108: }
{ 109: }
{ 110: }
{ 111: }
{ 112: }
{ 113: }
{ 114: }
{ 115: }
{ 116: }
  ( sym: -56; act: 103 ),
  ( sym: -54; act: 123 ),
  ( sym: -29; act: 105 ),
  ( sym: -25; act: 106 ),
  ( sym: -17; act: 107 ),
  ( sym: -6; act: 108 ),
  ( sym: -5; act: 109 ),
  ( sym: -3; act: 110 ),
{ 117: }
{ 118: }
{ 119: }
  ( sym: -26; act: 124 ),
{ 120: }
  ( sym: -60; act: 127 ),
{ 121: }
  ( sym: -59; act: 128 ),
{ 122: }
  ( sym: -61; act: 129 ),
{ 123: }
  ( sym: -23; act: 117 ),
{ 124: }
{ 125: }
{ 126: }
{ 127: }
  ( sym: -58; act: 130 ),
  ( sym: -56; act: 131 ),
  ( sym: -29; act: 105 ),
  ( sym: -25; act: 106 ),
{ 128: }
  ( sym: -58; act: 132 ),
  ( sym: -56; act: 131 ),
  ( sym: -29; act: 105 ),
  ( sym: -25; act: 106 ),
{ 129: }
  ( sym: -58; act: 133 ),
  ( sym: -56; act: 131 ),
  ( sym: -29; act: 105 ),
  ( sym: -25; act: 106 )
{ 130: }
{ 131: }
{ 132: }
{ 133: }
);

yyd : array [0..yynstates-1] of Integer = (
{ 0: } -36,
{ 1: } 0,
{ 2: } 0,
{ 3: } -37,
{ 4: } -41,
{ 5: } -31,
{ 6: } -55,
{ 7: } -54,
{ 8: } -53,
{ 9: } 0,
{ 10: } 0,
{ 11: } -49,
{ 12: } -47,
{ 13: } -45,
{ 14: } -43,
{ 15: } -38,
{ 16: } -6,
{ 17: } -7,
{ 18: } -8,
{ 19: } -9,
{ 20: } -10,
{ 21: } -11,
{ 22: } -12,
{ 23: } -13,
{ 24: } -14,
{ 25: } -16,
{ 26: } -17,
{ 27: } 0,
{ 28: } 0,
{ 29: } -39,
{ 30: } -40,
{ 31: } -1,
{ 32: } 0,
{ 33: } 0,
{ 34: } -27,
{ 35: } 0,
{ 36: } 0,
{ 37: } 0,
{ 38: } 0,
{ 39: } -42,
{ 40: } -19,
{ 41: } -18,
{ 42: } 0,
{ 43: } 0,
{ 44: } -78,
{ 45: } -82,
{ 46: } -69,
{ 47: } 0,
{ 48: } -75,
{ 49: } -72,
{ 50: } 0,
{ 51: } 0,
{ 52: } 0,
{ 53: } 0,
{ 54: } 0,
{ 55: } -77,
{ 56: } -84,
{ 57: } -2,
{ 58: } -81,
{ 59: } -87,
{ 60: } 0,
{ 61: } -88,
{ 62: } -23,
{ 63: } -83,
{ 64: } 0,
{ 65: } -70,
{ 66: } 0,
{ 67: } -20,
{ 68: } -73,
{ 69: } -57,
{ 70: } -28,
{ 71: } -29,
{ 72: } -58,
{ 73: } 0,
{ 74: } 0,
{ 75: } -64,
{ 76: } 0,
{ 77: } -61,
{ 78: } -3,
{ 79: } -4,
{ 80: } 0,
{ 81: } 0,
{ 82: } 0,
{ 83: } 0,
{ 84: } -33,
{ 85: } -35,
{ 86: } -90,
{ 87: } -79,
{ 88: } -71,
{ 89: } -74,
{ 90: } -59,
{ 91: } 0,
{ 92: } -62,
{ 93: } -67,
{ 94: } -5,
{ 95: } -68,
{ 96: } -85,
{ 97: } -21,
{ 98: } 0,
{ 99: } 0,
{ 100: } -60,
{ 101: } -63,
{ 102: } -90,
{ 103: } -94,
{ 104: } 0,
{ 105: } -98,
{ 106: } -96,
{ 107: } 0,
{ 108: } -92,
{ 109: } -91,
{ 110: } -93,
{ 111: } -30,
{ 112: } -24,
{ 113: } -95,
{ 114: } -15,
{ 115: } -80,
{ 116: } 0,
{ 117: } -106,
{ 118: } -22,
{ 119: } 0,
{ 120: } -102,
{ 121: } -100,
{ 122: } -104,
{ 123: } 0,
{ 124: } -97,
{ 125: } -25,
{ 126: } -26,
{ 127: } 0,
{ 128: } 0,
{ 129: } 0,
{ 130: } -103,
{ 131: } -108,
{ 132: } -101,
{ 133: } -105
);

yyal : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 1,
{ 2: } 13,
{ 3: } 14,
{ 4: } 14,
{ 5: } 14,
{ 6: } 14,
{ 7: } 14,
{ 8: } 14,
{ 9: } 14,
{ 10: } 16,
{ 11: } 30,
{ 12: } 30,
{ 13: } 30,
{ 14: } 30,
{ 15: } 30,
{ 16: } 30,
{ 17: } 30,
{ 18: } 30,
{ 19: } 30,
{ 20: } 30,
{ 21: } 30,
{ 22: } 30,
{ 23: } 30,
{ 24: } 30,
{ 25: } 30,
{ 26: } 30,
{ 27: } 30,
{ 28: } 32,
{ 29: } 35,
{ 30: } 35,
{ 31: } 35,
{ 32: } 35,
{ 33: } 48,
{ 34: } 49,
{ 35: } 49,
{ 36: } 54,
{ 37: } 59,
{ 38: } 64,
{ 39: } 69,
{ 40: } 69,
{ 41: } 69,
{ 42: } 69,
{ 43: } 70,
{ 44: } 75,
{ 45: } 75,
{ 46: } 75,
{ 47: } 75,
{ 48: } 89,
{ 49: } 89,
{ 50: } 89,
{ 51: } 91,
{ 52: } 95,
{ 53: } 99,
{ 54: } 103,
{ 55: } 107,
{ 56: } 107,
{ 57: } 107,
{ 58: } 107,
{ 59: } 107,
{ 60: } 107,
{ 61: } 109,
{ 62: } 109,
{ 63: } 109,
{ 64: } 109,
{ 65: } 111,
{ 66: } 111,
{ 67: } 113,
{ 68: } 113,
{ 69: } 113,
{ 70: } 113,
{ 71: } 113,
{ 72: } 113,
{ 73: } 113,
{ 74: } 129,
{ 75: } 146,
{ 76: } 146,
{ 77: } 163,
{ 78: } 163,
{ 79: } 163,
{ 80: } 163,
{ 81: } 179,
{ 82: } 195,
{ 83: } 211,
{ 84: } 212,
{ 85: } 212,
{ 86: } 212,
{ 87: } 212,
{ 88: } 212,
{ 89: } 212,
{ 90: } 212,
{ 91: } 212,
{ 92: } 216,
{ 93: } 216,
{ 94: } 216,
{ 95: } 216,
{ 96: } 216,
{ 97: } 216,
{ 98: } 216,
{ 99: } 228,
{ 100: } 229,
{ 101: } 229,
{ 102: } 229,
{ 103: } 229,
{ 104: } 229,
{ 105: } 235,
{ 106: } 235,
{ 107: } 235,
{ 108: } 238,
{ 109: } 238,
{ 110: } 238,
{ 111: } 238,
{ 112: } 238,
{ 113: } 238,
{ 114: } 238,
{ 115: } 238,
{ 116: } 238,
{ 117: } 250,
{ 118: } 250,
{ 119: } 250,
{ 120: } 252,
{ 121: } 252,
{ 122: } 252,
{ 123: } 252,
{ 124: } 258,
{ 125: } 258,
{ 126: } 258,
{ 127: } 258,
{ 128: } 266,
{ 129: } 274,
{ 130: } 282,
{ 131: } 282,
{ 132: } 282,
{ 133: } 282
);

yyah : array [0..yynstates-1] of Integer = (
{ 0: } 0,
{ 1: } 12,
{ 2: } 13,
{ 3: } 13,
{ 4: } 13,
{ 5: } 13,
{ 6: } 13,
{ 7: } 13,
{ 8: } 13,
{ 9: } 15,
{ 10: } 29,
{ 11: } 29,
{ 12: } 29,
{ 13: } 29,
{ 14: } 29,
{ 15: } 29,
{ 16: } 29,
{ 17: } 29,
{ 18: } 29,
{ 19: } 29,
{ 20: } 29,
{ 21: } 29,
{ 22: } 29,
{ 23: } 29,
{ 24: } 29,
{ 25: } 29,
{ 26: } 29,
{ 27: } 31,
{ 28: } 34,
{ 29: } 34,
{ 30: } 34,
{ 31: } 34,
{ 32: } 47,
{ 33: } 48,
{ 34: } 48,
{ 35: } 53,
{ 36: } 58,
{ 37: } 63,
{ 38: } 68,
{ 39: } 68,
{ 40: } 68,
{ 41: } 68,
{ 42: } 69,
{ 43: } 74,
{ 44: } 74,
{ 45: } 74,
{ 46: } 74,
{ 47: } 88,
{ 48: } 88,
{ 49: } 88,
{ 50: } 90,
{ 51: } 94,
{ 52: } 98,
{ 53: } 102,
{ 54: } 106,
{ 55: } 106,
{ 56: } 106,
{ 57: } 106,
{ 58: } 106,
{ 59: } 106,
{ 60: } 108,
{ 61: } 108,
{ 62: } 108,
{ 63: } 108,
{ 64: } 110,
{ 65: } 110,
{ 66: } 112,
{ 67: } 112,
{ 68: } 112,
{ 69: } 112,
{ 70: } 112,
{ 71: } 112,
{ 72: } 112,
{ 73: } 128,
{ 74: } 145,
{ 75: } 145,
{ 76: } 162,
{ 77: } 162,
{ 78: } 162,
{ 79: } 162,
{ 80: } 178,
{ 81: } 194,
{ 82: } 210,
{ 83: } 211,
{ 84: } 211,
{ 85: } 211,
{ 86: } 211,
{ 87: } 211,
{ 88: } 211,
{ 89: } 211,
{ 90: } 211,
{ 91: } 215,
{ 92: } 215,
{ 93: } 215,
{ 94: } 215,
{ 95: } 215,
{ 96: } 215,
{ 97: } 215,
{ 98: } 227,
{ 99: } 228,
{ 100: } 228,
{ 101: } 228,
{ 102: } 228,
{ 103: } 228,
{ 104: } 234,
{ 105: } 234,
{ 106: } 234,
{ 107: } 237,
{ 108: } 237,
{ 109: } 237,
{ 110: } 237,
{ 111: } 237,
{ 112: } 237,
{ 113: } 237,
{ 114: } 237,
{ 115: } 237,
{ 116: } 249,
{ 117: } 249,
{ 118: } 249,
{ 119: } 251,
{ 120: } 251,
{ 121: } 251,
{ 122: } 251,
{ 123: } 257,
{ 124: } 257,
{ 125: } 257,
{ 126: } 257,
{ 127: } 265,
{ 128: } 273,
{ 129: } 281,
{ 130: } 281,
{ 131: } 281,
{ 132: } 281,
{ 133: } 281
);

yygl : array [0..yynstates-1] of Integer = (
{ 0: } 1,
{ 1: } 3,
{ 2: } 15,
{ 3: } 15,
{ 4: } 15,
{ 5: } 16,
{ 6: } 17,
{ 7: } 17,
{ 8: } 17,
{ 9: } 17,
{ 10: } 18,
{ 11: } 20,
{ 12: } 21,
{ 13: } 22,
{ 14: } 23,
{ 15: } 24,
{ 16: } 24,
{ 17: } 24,
{ 18: } 24,
{ 19: } 24,
{ 20: } 24,
{ 21: } 24,
{ 22: } 24,
{ 23: } 24,
{ 24: } 24,
{ 25: } 24,
{ 26: } 24,
{ 27: } 24,
{ 28: } 25,
{ 29: } 28,
{ 30: } 28,
{ 31: } 28,
{ 32: } 28,
{ 33: } 31,
{ 34: } 32,
{ 35: } 32,
{ 36: } 34,
{ 37: } 36,
{ 38: } 38,
{ 39: } 40,
{ 40: } 40,
{ 41: } 40,
{ 42: } 40,
{ 43: } 42,
{ 44: } 47,
{ 45: } 48,
{ 46: } 48,
{ 47: } 48,
{ 48: } 51,
{ 49: } 51,
{ 50: } 51,
{ 51: } 52,
{ 52: } 57,
{ 53: } 62,
{ 54: } 67,
{ 55: } 72,
{ 56: } 72,
{ 57: } 73,
{ 58: } 73,
{ 59: } 73,
{ 60: } 73,
{ 61: } 75,
{ 62: } 76,
{ 63: } 76,
{ 64: } 76,
{ 65: } 77,
{ 66: } 77,
{ 67: } 79,
{ 68: } 79,
{ 69: } 79,
{ 70: } 79,
{ 71: } 79,
{ 72: } 79,
{ 73: } 79,
{ 74: } 84,
{ 75: } 85,
{ 76: } 85,
{ 77: } 86,
{ 78: } 86,
{ 79: } 86,
{ 80: } 86,
{ 81: } 91,
{ 82: } 96,
{ 83: } 101,
{ 84: } 102,
{ 85: } 102,
{ 86: } 102,
{ 87: } 103,
{ 88: } 104,
{ 89: } 104,
{ 90: } 104,
{ 91: } 104,
{ 92: } 108,
{ 93: } 108,
{ 94: } 108,
{ 95: } 108,
{ 96: } 108,
{ 97: } 109,
{ 98: } 109,
{ 99: } 117,
{ 100: } 119,
{ 101: } 119,
{ 102: } 119,
{ 103: } 120,
{ 104: } 120,
{ 105: } 121,
{ 106: } 121,
{ 107: } 122,
{ 108: } 125,
{ 109: } 125,
{ 110: } 125,
{ 111: } 125,
{ 112: } 125,
{ 113: } 125,
{ 114: } 125,
{ 115: } 125,
{ 116: } 125,
{ 117: } 133,
{ 118: } 133,
{ 119: } 133,
{ 120: } 134,
{ 121: } 135,
{ 122: } 136,
{ 123: } 137,
{ 124: } 138,
{ 125: } 138,
{ 126: } 138,
{ 127: } 138,
{ 128: } 142,
{ 129: } 146,
{ 130: } 150,
{ 131: } 150,
{ 132: } 150,
{ 133: } 150
);

yygh : array [0..yynstates-1] of Integer = (
{ 0: } 2,
{ 1: } 14,
{ 2: } 14,
{ 3: } 14,
{ 4: } 15,
{ 5: } 16,
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
{ 26: } 23,
{ 27: } 24,
{ 28: } 27,
{ 29: } 27,
{ 30: } 27,
{ 31: } 27,
{ 32: } 30,
{ 33: } 31,
{ 34: } 31,
{ 35: } 33,
{ 36: } 35,
{ 37: } 37,
{ 38: } 39,
{ 39: } 39,
{ 40: } 39,
{ 41: } 39,
{ 42: } 41,
{ 43: } 46,
{ 44: } 47,
{ 45: } 47,
{ 46: } 47,
{ 47: } 50,
{ 48: } 50,
{ 49: } 50,
{ 50: } 51,
{ 51: } 56,
{ 52: } 61,
{ 53: } 66,
{ 54: } 71,
{ 55: } 71,
{ 56: } 72,
{ 57: } 72,
{ 58: } 72,
{ 59: } 72,
{ 60: } 74,
{ 61: } 75,
{ 62: } 75,
{ 63: } 75,
{ 64: } 76,
{ 65: } 76,
{ 66: } 78,
{ 67: } 78,
{ 68: } 78,
{ 69: } 78,
{ 70: } 78,
{ 71: } 78,
{ 72: } 78,
{ 73: } 83,
{ 74: } 84,
{ 75: } 84,
{ 76: } 85,
{ 77: } 85,
{ 78: } 85,
{ 79: } 85,
{ 80: } 90,
{ 81: } 95,
{ 82: } 100,
{ 83: } 101,
{ 84: } 101,
{ 85: } 101,
{ 86: } 102,
{ 87: } 103,
{ 88: } 103,
{ 89: } 103,
{ 90: } 103,
{ 91: } 107,
{ 92: } 107,
{ 93: } 107,
{ 94: } 107,
{ 95: } 107,
{ 96: } 108,
{ 97: } 108,
{ 98: } 116,
{ 99: } 118,
{ 100: } 118,
{ 101: } 118,
{ 102: } 119,
{ 103: } 119,
{ 104: } 120,
{ 105: } 120,
{ 106: } 121,
{ 107: } 124,
{ 108: } 124,
{ 109: } 124,
{ 110: } 124,
{ 111: } 124,
{ 112: } 124,
{ 113: } 124,
{ 114: } 124,
{ 115: } 124,
{ 116: } 132,
{ 117: } 132,
{ 118: } 132,
{ 119: } 133,
{ 120: } 134,
{ 121: } 135,
{ 122: } 136,
{ 123: } 137,
{ 124: } 137,
{ 125: } 137,
{ 126: } 137,
{ 127: } 141,
{ 128: } 145,
{ 129: } 149,
{ 130: } 149,
{ 131: } 149,
{ 132: } 149,
{ 133: } 149
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
{ 18: } ( len: 1; sym: -20 ),
{ 19: } ( len: 1; sym: -20 ),
{ 20: } ( len: 1; sym: -21 ),
{ 21: } ( len: 1; sym: -22 ),
{ 22: } ( len: 1; sym: -23 ),
{ 23: } ( len: 1; sym: -24 ),
{ 24: } ( len: 1; sym: -25 ),
{ 25: } ( len: 1; sym: -26 ),
{ 26: } ( len: 1; sym: -26 ),
{ 27: } ( len: 1; sym: -27 ),
{ 28: } ( len: 1; sym: -28 ),
{ 29: } ( len: 1; sym: -28 ),
{ 30: } ( len: 1; sym: -29 ),
{ 31: } ( len: 0; sym: -32 ),
{ 32: } ( len: 0; sym: -34 ),
{ 33: } ( len: 6; sym: -2 ),
{ 34: } ( len: 0; sym: -33 ),
{ 35: } ( len: 1; sym: -33 ),
{ 36: } ( len: 0; sym: -30 ),
{ 37: } ( len: 2; sym: -30 ),
{ 38: } ( len: 2; sym: -30 ),
{ 39: } ( len: 2; sym: -35 ),
{ 40: } ( len: 2; sym: -35 ),
{ 41: } ( len: 0; sym: -36 ),
{ 42: } ( len: 3; sym: -35 ),
{ 43: } ( len: 0; sym: -38 ),
{ 44: } ( len: 4; sym: -35 ),
{ 45: } ( len: 0; sym: -40 ),
{ 46: } ( len: 4; sym: -35 ),
{ 47: } ( len: 0; sym: -41 ),
{ 48: } ( len: 4; sym: -35 ),
{ 49: } ( len: 0; sym: -42 ),
{ 50: } ( len: 4; sym: -35 ),
{ 51: } ( len: 3; sym: -35 ),
{ 52: } ( len: 2; sym: -35 ),
{ 53: } ( len: 1; sym: -35 ),
{ 54: } ( len: 1; sym: -35 ),
{ 55: } ( len: 1; sym: -35 ),
{ 56: } ( len: 0; sym: -37 ),
{ 57: } ( len: 3; sym: -37 ),
{ 58: } ( len: 1; sym: -39 ),
{ 59: } ( len: 2; sym: -39 ),
{ 60: } ( len: 3; sym: -39 ),
{ 61: } ( len: 1; sym: -39 ),
{ 62: } ( len: 2; sym: -39 ),
{ 63: } ( len: 3; sym: -39 ),
{ 64: } ( len: 1; sym: -44 ),
{ 65: } ( len: 1; sym: -44 ),
{ 66: } ( len: 1; sym: -44 ),
{ 67: } ( len: 2; sym: -44 ),
{ 68: } ( len: 2; sym: -44 ),
{ 69: } ( len: 1; sym: -43 ),
{ 70: } ( len: 2; sym: -43 ),
{ 71: } ( len: 3; sym: -43 ),
{ 72: } ( len: 1; sym: -43 ),
{ 73: } ( len: 2; sym: -43 ),
{ 74: } ( len: 3; sym: -43 ),
{ 75: } ( len: 1; sym: -45 ),
{ 76: } ( len: 0; sym: -47 ),
{ 77: } ( len: 2; sym: -31 ),
{ 78: } ( len: 0; sym: -48 ),
{ 79: } ( len: 0; sym: -49 ),
{ 80: } ( len: 5; sym: -31 ),
{ 81: } ( len: 2; sym: -31 ),
{ 82: } ( len: 1; sym: -31 ),
{ 83: } ( len: 2; sym: -31 ),
{ 84: } ( len: 0; sym: -51 ),
{ 85: } ( len: 0; sym: -53 ),
{ 86: } ( len: 6; sym: -46 ),
{ 87: } ( len: 1; sym: -50 ),
{ 88: } ( len: 0; sym: -55 ),
{ 89: } ( len: 4; sym: -50 ),
{ 90: } ( len: 0; sym: -52 ),
{ 91: } ( len: 2; sym: -52 ),
{ 92: } ( len: 2; sym: -52 ),
{ 93: } ( len: 2; sym: -52 ),
{ 94: } ( len: 2; sym: -52 ),
{ 95: } ( len: 2; sym: -52 ),
{ 96: } ( len: 0; sym: -57 ),
{ 97: } ( len: 3; sym: -56 ),
{ 98: } ( len: 1; sym: -56 ),
{ 99: } ( len: 0; sym: -54 ),
{ 100: } ( len: 0; sym: -59 ),
{ 101: } ( len: 4; sym: -54 ),
{ 102: } ( len: 0; sym: -60 ),
{ 103: } ( len: 4; sym: -54 ),
{ 104: } ( len: 0; sym: -61 ),
{ 105: } ( len: 4; sym: -54 ),
{ 106: } ( len: 2; sym: -54 ),
{ 107: } ( len: 0; sym: -58 ),
{ 108: } ( len: 1; sym: -58 )
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
        no_of_entries = 14;
        max_entry_length = 9;
        keys : array [1..no_of_entries] of String[max_entry_length] = (
          '0', '2', 'binary', 'classfunc', 'classname', 'classvar', 'left', 'nonassoc', 'prec', 'right',
          'start', 'term', 'token', 'type');
        toks : array [1..no_of_entries] of integer = (
          PTOKEN, PNONASSOC, PNONASSOC, PCLASSFUNC, PCLASSNAME, PCLASSVAR, PLEFT, PNONASSOC, PPREC, PRIGHT,
          PSTART, PTOKEN, PTOKEN, PTYPE);
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
                if (tok = PCLASSNAME) or
                   (tok = PCLASSFUNC) or
                   (tok = PCLASSVAR) then
                begin
                  if object_oriented then
                  begin
                    trail := Copy(line, cno, Length(Line) { will trunc });
                    if (tok = PCLASSNAME) then
                    begin
                      trail := Trim(trail);
                      if SetClassName(trail) = 0 then
                      begin
                        scan_keyword := tok; // Good token.
                        cno := Succ(Length(Line)); // Swallow the rest of the line.
                      end
                      else
                        scan_keyword := ILLEGAL;
                    end
                    else if (tok = PCLASSFUNC) then
                    begin
                      if AddClassFunc(trail) = 0 then
                      begin
                        scan_keyword := tok; // Good token.
                        cno := Succ(Length(Line)); // Swallow the rest of the line.
                      end
                      else
                        scan_keyword := ILLEGAL;
                    end
                    else // tok = PCLASSVAR
                    begin
                      if AddClassVar(trail) = 0 then
                      begin
                        scan_keyword := tok; // Good token.
                        cno := Succ(Length(Line)); // Swallow the rest of the line.
                      end
                      else
                        scan_keyword := ILLEGAL;
                    end;
                  end
                  else
                    scan_keyword := ILLEGAL; //Need oo mode to scan these.
                end
                else
                  scan_keyword := tok;
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
    codfilename := codfilepath + 'yyparse_oo.cod'
  else
    codfilename := codfilepath + 'yyparse.cod';
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