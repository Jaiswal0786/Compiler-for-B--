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
-?[0-9]+\.[0-9]+    { fprintf(yyout,"FLOAT: %s\n", yytext); yylval.fvalue = atof(yytext); return FLOAT; }
-?[0-9]+            { fprintf(yyout,"INT: %s\n", yytext); yylval.ivalue = atoi(yytext); return INT; }
\"([^\\\n])*\"      { fprintf(yyout,"STRING: %s\n", yytext); yylval.svalue = strdup(yytext+1); yylval.svalue[strlen(yytext)-2] = '\0'; return STRING; }
IF                  { fprintf(yyout,"IF\n"); return IF; }
THEN                { fprintf(yyout,"THEN\n"); return THEN; }
FOR                 { fprintf(yyout,"FOR\n"); return FOR; }
TO                  { fprintf(yyout,"TO\n"); return TO; }
STEP                { fprintf(yyout,"STEP\n"); return STEP; }
DIM                 { fprintf(yyout,"DIM\n"); return DIM; }
DATA                { fprintf(yyout,"DATA\n"); return DATA; }
GOTO                { fprintf(yyout,"GOTO\n"); return GOTO; }
GOSUB               { fprintf(yyout,"GOSUB\n"); return GOSUB; }
RETURN              { fprintf(yyout,"RETURN\n"); return RETURN; }
DEF                 { fprintf(yyout,"DEF\n"); return DEF; }
LET                 { fprintf(yyout,"LET\n"); return LET; }
INPUT               { fprintf(yyout,"INPUT\n"); return INPUT; }
PRINT               { fprintf(yyout,"PRINT\n"); return PRINT; }
REM.*               { fprintf(yyout,"REM\n"); return REM; }
NEXT.*              { fprintf(yyout,"NEXT\n"); return NEXT; }
END                 { fprintf(yyout,"END\n"); return END; }
STOP                { fprintf(yyout,"STOP\n"); return STOP; }
\<\>                { fprintf(yyout,"NEQ\n"); return NEQ; }
\<=                 { fprintf(yyout,"LE\n"); return LE; }
\>=                 { fprintf(yyout,"GE\n"); return GE; }
=                   { fprintf(yyout,"EQ\n"); return EQ; }
\<                  { fprintf(yyout,"LT\n"); return LT; }
\>                  { fprintf(yyout,"GT\n"); return GT; }
\+                  { fprintf(yyout,"PLUS\n"); return PLUS; }
\-                  { fprintf(yyout,"MINUS\n"); return MINUS; }
\*                  { fprintf(yyout,"MUL\n"); return MUL; }
\/                  { fprintf(yyout,"DIV\n"); return DIV; }
\^                  { fprintf(yyout,"POW\n"); return POW; }
\,                  { fprintf(yyout,"COMMA\n"); return COMMA; }
\;                  { fprintf(yyout,"SEMICOLON\n"); return SEMICOLON; }
\(                  { fprintf(yyout,"L_BRACE\n"); return L_BRACE; }
\)                  { fprintf(yyout,"R_BRACE\n"); return R_BRACE; }
\!                  { fprintf(yyout,"EXCLAMATION\n"); return EXCLAMATION; }
FN[A-Z]+            { fprintf(yyout,"FUNCTION\n"); return FN;}
\$                  { fprintf(yyout,"DOLLAR\n"); return DOLLAR; }
%                   { fprintf(yyout,"MODULO\n"); return MODULO; }
#                   { fprintf(yyout,"HASH\n"); return HASH; }
[A-Z][A-Z0-9]*      { fprintf(yyout,"IDENTIFIER\n"); yylval.svalue = strdup(yytext); return IDENTIFIER; }
\.                  { fprintf(yyout,"Unexpected character\n"); }

%%
