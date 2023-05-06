%{
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}

%%

" "+              /* skip whitespace */
\n                  { return NEWLINE;}
\t                  { return TAB;}                  
[0-9]+\.[0-9]+      { printf("FLOAT: %s\n", yytext); yylval.fvalue = atof(yytext); return FLOAT; }
[0-9]+              { printf("INT: %s\n", yytext); yylval.ivalue = atoi(yytext); return INT; }
\"([^\\\n])*\"      { printf("STRING: %s\n", yytext); yylval.svalue = strdup(yytext+1); yylval.svalue[strlen(yytext)-2] = '\0'; return STRING; }
IF                  { printf("IF\n"); return IF; }
THEN                { printf("THEN\n"); return THEN; }
FOR                 { printf("FOR\n"); return FOR; }
TO                  { printf("TO\n"); return TO; }
STEP                { printf("STEP\n"); return STEP; }
DIM                 { printf("DIM\n"); return DIM; }
DATA                { printf("DATA\n"); return DATA; }
GOTO                { printf("GOTO\n"); return GOTO; }
GOSUB               { printf("GOSUB\n"); return GOSUB; }
RETURN              { printf("RETURN\n"); return RETURN; }
DEF                 { printf("DEF\n"); return DEF; }
LET                 { printf("LET\n"); return LET; }
INPUT               { printf("INPUT\n"); return INPUT; }
PRINT               { printf("PRINT\n"); return PRINT; }
REM                 { printf("REM\n"); return REM; }
END                 { printf("END\n"); return END; }
\<\>                { printf("NEQ\n"); return NEQ; }
\<=                 { printf("LE\n"); return LE; }
\>=                 { printf("GE\n"); return GE; }
=                   { printf("EQ\n"); return EQ; }
\<                  { printf("LT\n"); return LT; }
\>                  { printf("GT\n"); return GT; }
\+                  { printf("PLUS\n"); return PLUS; }
\-                  { printf("MINUS\n"); return MINUS; }
\*                  { printf("MUL\n"); return MUL; }
\/                  { printf("DIV\n"); return DIV; }
\^                  { printf("POW\n"); return POW; }
\,                  { printf("COMMA\n"); return COMMA; }
\;                  { printf("SEMICOLON\n"); return SEMICOLON; }
\(                  { printf("L_BRACE\n"); return L_BRACE; }
\)                  { printf("R_BRACE\n"); return R_BRACE; }
\!                  { printf("EXCLAMATION\n"); return EXCLAMATION; }
FN[A-Z]+            { printf("FUNCTION\n"); return FN;}
\$                  { printf("DOLLA\n"); return DOLLAR; }
%                   { printf("MODULO\n"); return MODULO; }
#                   { printf("HASH\n"); return HASH; }
[A-Z][A-Z0-9]*      { printf("IDENTIFIER\n"); yylval.svalue = strdup(yytext); return IDENTIFIER; }
\.                  { printf("Unexpected character\n"); }

%%