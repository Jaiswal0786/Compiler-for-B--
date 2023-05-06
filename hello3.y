%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
// #include <common.h>
// #include "B--_lex.yy.h"
int prev=-1;
void yyerror(const char *str)
{
     fprintf(stderr,"error: %s\n",str);
}
int yywrap()
{
return 1;
}
main()
{
     yyin=fopen("input.bmm","r"); yyout=fopen("output.bmm","w");
     yyparse();
}
%}

%union {
    int ivalue;
    float fvalue;
    char chvalue;
    char* svalue;
}

%token INT
%token FLOAT
%token STRING
%token IF THEN FOR TO STEP DIM DATA GOTO GOSUB RETURN DEF LET INPUT PRINT REM END TAB
%token NEQ LE GE EQ LT GT PLUS MINUS MUL DIV POW COMMA SEMICOLON EXCLAMATION DOLLAR MODULO HASH
%token IDENTIFIER
%token NEWLINE
%token FN
%token L_BRACE R_BRACE


%%

program     : statements END 

statements  : statement
            | statement statements


statement: INT data_statement NEWLINE {
          if(prev>=atoi($1))
               yyerror("Line Error Detected");
          prev=atoi($1);

}
         | INT def_statement NEWLINE
         | INT dim_statement NEWLINE
         | INT end_statement NEWLINE
         | INT for_statement NEWLINE
         | INT gosub_statement NEWLINE
         | INT goto_statement NEWLINE
         | INT if_statement NEWLINE
         | INT let_statement NEWLINE
         | INT input_statement NEWLINE
         | INT print_statement NEWLINE
         | INT rem_statement NEWLINE
         | INT return_statement NEWLINE
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

def_statement: DEF FN L_BRACE IDENTIFIER R_BRACE EQ expression
             | DEF FN EQ expression
             | DEF FN L_BRACE R_BRACE EQ expression
             ;

expression: INT
          | FLOAT
          | IDENTIFIER 
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

end_statement: END
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

let_statement: LET IDENTIFIER EQ expression
             | LET IDENTIFIER HASH EQ expression;
             | LET IDENTIFIER DOLLAR EQ expression;
             | LET IDENTIFIER MODULO EQ expression;
             | LET IDENTIFIER EXCLAMATION EQ expression;
             ;

input_statement: INPUT input_list
               ;

input_list: input_var
          | input_list COMMA input_var
          ;

input_var: IDENTIFIER
         | IDENTIFIER L_BRACE INT R_BRACE
         ;

print_statement: PRINT print_list
               ;

print_list: print_item
          | print_list COMMA print_item
          | print_list SEMICOLON print_item
          ;

print_item: INT
          | STRING
          | IDENTIFIER
          | L_BRACE expression R_BRACE
          ;

rem_statement: REM words
             | REM
             ;
words: IDENTIFIER
     | words IDENTIFIER
     ;

return_statement: RETURN