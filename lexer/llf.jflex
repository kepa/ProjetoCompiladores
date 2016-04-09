package br.cin.llf;

import java_cup.runtime.*;

%%
%unicode
%cup
%standalone
%debug
%line
%column

//Nome da classe
%class LLFlexer


/* DECLARACOES LEXICOS */

//Tanto quebra de linha quanto para comeco e quebra de linha
FimDeLinha = \r|\n|\r\n 

//Pode ser espaco simples tab e quebra linha
WhiteSpace = [ \t\f] | FimDeLinha 

//Comentario
//Avalia de unica linha multiplas linhas e ultima linha do arquivo

Comentario = "//" ~{FimDeLinha}? | "/*" [^*] ~"*/" | "//" [^\r\n]* {FimDeLinha}?

Letra           = [A-Za-z]
Inteiro         = 0 | [0-9] | [1-9][0-9]*
Alphanumerico   = {Letra}|{Inteiro}
IdentUnder      = [_]+ ({Alphanumerico} | [_])*
Ident           = {Letra}({Alphanumerico} | [_])*
identificador   = {Ident} | {IdentUnder}



%%

//Palavras Reservadas

boolean                { System.out.println("Token boolean"); }
class                  { System.out.println("Token class"); }
public                 { System.out.println("Token public"); }
extends                { System.out.println("Token extends"); } 
static                 { System.out.println("Token static"); } 
void                   { System.out.println("Token void"); } 
main                   { System.out.println("Token main"); } 
String                 { System.out.println("Token String"); } 
int                    { System.out.println("Token int"); } 
while                  { System.out.println("Token while"); } 
if                     { System.out.println("Token if"); } 
else                   { System.out.println("Token else"); } 
return                 { System.out.println("Token return"); } 
length                 { System.out.println("Token length"); } 
true                   { System.out.println("Token true"); } 
false                  { System.out.println("Token false"); } 
this                   { System.out.println("Token this"); } 
new                    { System.out.println("Token new"); } 
System.out.println     { System.out.println("Token println"); } 

//Delimitadores

"&&"                   { System.out.println("Token &&"); } 
"<"                    { System.out.println("Token <"); }
"=="                   { System.out.println("Token =="); } 
"!="                   { System.out.println("Token !="); } 
"+"                    { System.out.println("Token +"); }
"-"                    { System.out.println("Token -"); }
"*"                    { System.out.println("Token *"); }
"!"                    { System.out.println("Token !"); }
";"                    { System.out.println("Token ;"); }
"."                    { System.out.println("Token ."); }
"="                    { System.out.println("Token ="); }
"("                    { System.out.println("Token ("); }
")"                    { System.out.println("Token )"); }
"{"                    { System.out.println("Token {"); }
"}"                    { System.out.println("Token }"); }
"["                    { System.out.println("Token ["); }
"]"                    { System.out.println("Token ]"); }

identificador          { System.out.println("Token ID ("+yytext()+")"); }
Inteiro                { System.out.println("Token INT ("+yytext()+")"); }

//Os ignorados

Comentario {}
WhiteSpace {}

//Caso haja carectere ilegal
.                      { throw new RuntimeException("Caractere ilegal! '" + yytext() + "' na linha: " + yyline + ", coluna: " + yycolumn); }

