/* A Bison parser, made by GNU Bison 3.8.2.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2021 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* DO NOT RELY ON FEATURES THAT ARE NOT DOCUMENTED in the manual,
   especially those whose name start with YY_ or yy_.  They are
   private implementation details that can be changed or removed.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token kinds.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    YYEMPTY = -2,
    YYEOF = 0,                     /* "end of file"  */
    YYerror = 256,                 /* error  */
    YYUNDEF = 257,                 /* "invalid token"  */
    INT = 258,                     /* INT  */
    FLOAT = 259,                   /* FLOAT  */
    STRING = 260,                  /* STRING  */
    IF = 261,                      /* IF  */
    THEN = 262,                    /* THEN  */
    FOR = 263,                     /* FOR  */
    TO = 264,                      /* TO  */
    STEP = 265,                    /* STEP  */
    NEXT = 266,                    /* NEXT  */
    DIM = 267,                     /* DIM  */
    DATA = 268,                    /* DATA  */
    GOTO = 269,                    /* GOTO  */
    GOSUB = 270,                   /* GOSUB  */
    RETURN = 271,                  /* RETURN  */
    DEF = 272,                     /* DEF  */
    LET = 273,                     /* LET  */
    INPUT = 274,                   /* INPUT  */
    PRINT = 275,                   /* PRINT  */
    REM = 276,                     /* REM  */
    END = 277,                     /* END  */
    STOP = 278,                    /* STOP  */
    TAB = 279,                     /* TAB  */
    NEQ = 280,                     /* NEQ  */
    LE = 281,                      /* LE  */
    GE = 282,                      /* GE  */
    EQ = 283,                      /* EQ  */
    LT = 284,                      /* LT  */
    GT = 285,                      /* GT  */
    PLUS = 286,                    /* PLUS  */
    MINUS = 287,                   /* MINUS  */
    MUL = 288,                     /* MUL  */
    DIV = 289,                     /* DIV  */
    POW = 290,                     /* POW  */
    COMMA = 291,                   /* COMMA  */
    SEMICOLON = 292,               /* SEMICOLON  */
    EXCLAMATION = 293,             /* EXCLAMATION  */
    DOLLAR = 294,                  /* DOLLAR  */
    MODULO = 295,                  /* MODULO  */
    HASH = 296,                    /* HASH  */
    IDENTIFIER = 297,              /* IDENTIFIER  */
    NEWLINE = 298,                 /* NEWLINE  */
    FN = 299,                      /* FN  */
    L_BRACE = 300,                 /* L_BRACE  */
    R_BRACE = 301                  /* R_BRACE  */
  };
  typedef enum yytokentype yytoken_kind_t;
#endif
/* Token kinds.  */
#define YYEMPTY -2
#define YYEOF 0
#define YYerror 256
#define YYUNDEF 257
#define INT 258
#define FLOAT 259
#define STRING 260
#define IF 261
#define THEN 262
#define FOR 263
#define TO 264
#define STEP 265
#define NEXT 266
#define DIM 267
#define DATA 268
#define GOTO 269
#define GOSUB 270
#define RETURN 271
#define DEF 272
#define LET 273
#define INPUT 274
#define PRINT 275
#define REM 276
#define END 277
#define STOP 278
#define TAB 279
#define NEQ 280
#define LE 281
#define GE 282
#define EQ 283
#define LT 284
#define GT 285
#define PLUS 286
#define MINUS 287
#define MUL 288
#define DIV 289
#define POW 290
#define COMMA 291
#define SEMICOLON 292
#define EXCLAMATION 293
#define DOLLAR 294
#define MODULO 295
#define HASH 296
#define IDENTIFIER 297
#define NEWLINE 298
#define FN 299
#define L_BRACE 300
#define R_BRACE 301

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
union YYSTYPE
{
#line 27 "BMM_Parser.y"

    int ivalue;
    float fvalue;
    char chvalue;
    char* svalue;

#line 166 "y.tab.h"

};
typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;


int yyparse (void);


#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
