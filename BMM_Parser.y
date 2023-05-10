%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// #include <common.h>
#include "y.tab.h"

extern FILE *yyin, *yyout;
void yyerror(const char *str)
{
     fprintf(stderr,"error: %s\n",str);
}
int yywrap()
{
     return 1;
}
int prev=-1;
int main()
{
     yyin=fopen("input.txt","r"); yyout=fopen("output.txt","w");
     yyparse();

     return 0;
}
%}

%union {
    int ivalue;
    float fvalue;
    char chvalue;
    char* svalue;
}

%token <ivalue> INT
%token <fvalue> FLOAT
%token <svalue> STRING
%token IF THEN FOR TO STEP NEXT DIM DATA GOTO GOSUB RETURN DEF LET INPUT PRINT REM END STOP TAB
%token NEQ LE GE EQ LT GT PLUS MINUS MUL DIV POW COMMA SEMICOLON EXCLAMATION DOLLAR MODULO HASH
%token IDENTIFIER
%token NEWLINE
%token FN
%token L_BRACE R_BRACE


%%

program     : statements 
statements  : statement_x
            | statement_x statements

statement_x: INT statement NEWLINE
          {
          if(prev>=$1)
               yyerror("Line Error Detected"), exit(1);
          prev=$1;

          }
statement:  data_statement  
         |  def_statement 
         |  dim_statement 
         |  for_statement 
         |  gosub_statement 
         |  goto_statement 
         |  if_statement 
         |  let_statement 
         |  input_statement 
         |  print_statement 
         |  rem_statement 
         |  return_statement 
         |  next_statement 
         |  END {fprintf(yyout, "SUCCESSFULLY ENDED");exit(0);}
         |  STOP {fprintf(yyout, "SUCCESSFULLY STOPPED");exit(0);}
         ;


data_statement: DATA value_list
              ;

value_list: value
          | value_list COMMA value
          ;

value: INT
     | FLOAT
     | STRING
     ;

def_statement: DEF func_x EQ expression
             ;

func_x: FN L_BRACE IDENTIFIER R_BRACE 
      | FN L_BRACE R_BRACE
      | FN 

expression: INT
          | FLOAT
          | STRING
          | IDENTIFIER_Y 
          | func_x
          | expression PLUS expression
          | expression MINUS expression
          | expression MUL expression
          | expression DIV expression
          | expression POW expression
          | L_BRACE expression R_BRACE
          ;

dim_statement: DIM dim_list
             ;

dim_list: dim_declaration
        | dim_list COMMA dim_declaration
        ;

dim_declaration: IDENTIFIER L_BRACE INT R_BRACE
                | IDENTIFIER L_BRACE INT COMMA INT R_BRACE
                ;

for_statement: FOR IDENTIFIER EQ expression TO expression
               | FOR IDENTIFIER EQ expression TO expression STEP expression
               ;

gosub_statement: GOSUB INT
               ;

goto_statement: GOTO INT
              ;

if_statement: IF condition THEN INT
            ;

condition: expression LT expression
         | expression LE expression
         | expression EQ expression
         | expression GE expression
         | expression GT expression
         | expression NEQ expression
         ;

let_statement: LET IDENTIFIER_Y EQ expression;

input_statement: INPUT input_list
               ;

input_list: input_var
          | input_list COMMA input_var
          ;

input_var: IDENTIFIER_X
         | IDENTIFIER_X L_BRACE INT R_BRACE
         | IDENTIFIER_X L_BRACE IDENTIFIER_X R_BRACE
         ;
IDENTIFIER_Y: IDENTIFIER_X L_BRACE expression R_BRACE
            | IDENTIFIER_X L_BRACE INT R_BRACE
            | IDENTIFIER_X
IDENTIFIER_X: IDENTIFIER|IDENTIFIER DOLLAR | IDENTIFIER MODULO | IDENTIFIER EXCLAMATION | IDENTIFIER HASH

print_statement: PRINT print_list
               | PRINT print_list SEMICOLON
               | PRINT print_list COMMA
               ;

print_list: print_item
          | print_list COMMA print_item 
          | print_list SEMICOLON print_item
          ;

print_item: INT
          | STRING
          | IDENTIFIER
          | L_BRACE expression R_BRACE 
          | func_x
          ;
next_statement: NEXT words| NEXT
rem_statement: REM words
             | REM
             ;
words: IDENTIFIER
     | words IDENTIFIER
     ;

return_statement: RETURN
