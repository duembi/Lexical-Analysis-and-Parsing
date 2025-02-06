%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *str)
{
    fprintf(stderr, "error: %s\n", str);
    exit(0);
}
%}

%token TERM FIRST LAST
%token GREAEQ LEQL THE_GREA_THANN MORE__LESST IS_THAT_NOT_EQUAL 
%token _UN_LESS_ LEFT STILL BAS_BAS S_E_Q_A RG_BRA LF_BRA
%token PRODUCTION_OPEARATION DIVVY_UP ADD_TOGETHER OPP_SUBTRACT_OPP OR AND
%token CATEGORY FIELD IS_EEEQQUAL END_OFLINE
%token LEFT_BR RGT_BR
%token INTEGER FLOAT CHARACTER

%left OR
%left AND
%left THE_GREA_THANN GREAEQ MORE__LESST LEQL IS_THAT_EQUAL IS_THAT_NOT_EQUAL 
%left ADD_TOGETHER OPP_SUBTRACT_OPP
%left PRODUCTION_OPEARATION DIVVY_UP

%%

program:
      FIRST declarations statements LAST
    | FIRST LAST
    ;

declarations:
      declaration
    | declaration declarations
    ;

declaration:
       CATEGORY FIELD
     | CATEGORY FIELD IS_EEEQQUAL expression END_OFLINE
    ;

statements:
      statement
    | statement statements
    ;

statement:
      assignment
    | TERM END_OFLINE
    | conditional
    | still
    | seq
    | print_state
    ;

assignment:
      FIELD IS_EEEQQUAL expression END_OFLINE
    ;

expression:
      const
    | FIELD
    | expression OR expression
    | expression AND expression
    | expression THE_GREA_THANN expression
    | expression GREAEQ expression
    | expression MORE__LESST expression
    | expression LEQL expression
    | expression IS_THAT_EQUAL expression
    | expression IS_THAT_NOT_EQUAL expression
    | expression ADD_TOGETHER expression
    | expression OPP_SUBTRACT_OPP expression
    | expression PRODUCTION_OPEARATION expression
    | expression DIVVY_UP expression
    | LF_BRA expression RG_BRA
    ;

conditional:
      _UN_LESS_ LEFT_BR expression RGT_BR LF_BRA statements RG_BRA
    | _UN_LESS_ LEFT_BR expression RGT_BR LF_BRA statements RG_BRA LEFT LF_BRA statements RG_BRA
    ;

still:
    STILL LEFT_BR expression RGT_BR LF_BRA statements RG_BRA
    ;

seq:
    S_E_Q_A LEFT_BR assignment cond_op END_OFLINE math_op RGT_BR LF_BRA statements RG_BRA
    ;

print_state:
    BAS_BAS LEFT_BR FIELD RGT_BR
    ;

const:
      INTEGER
    | FLOAT
    | CHARACTER
    ;

cond_op:
      FIELD THE_GREA_THANN const
    | FIELD GREAEQ const
    | FIELD MORE__LESST const
    | FIELD LEQL const
    | FIELD IS_THAT_EQUAL const
    | FIELD IS_THAT_NOT_EQUAL const
    | FIELD THE_GREA_THANN FIELD
    | FIELD GREAEQ FIELD
    | FIELD MORE__LESST FIELD
    | FIELD LEQL FIELD
    | FIELD IS_THAT_EQUAL FIELD
    | FIELD IS_THAT_NOT_EQUAL FIELD
    | const THE_GREA_THANN FIELD
    | const GREAEQ FIELD
    | const MORE__LESST FIELD
    | const LEQL FIELD
    | const IS_THAT_EQUAL FIELD
    | const IS_THAT_NOT_EQUAL FIELD
    ;

math_op:
      FIELD ADD_TOGETHER const
    | FIELD OPP_SUBTRACT_OPP const
    | FIELD PRODUCTION_OPEARATION const
    | FIELD DIVVY_UP const
    ;

%%

int main()
{
    yyparse();
    printf("OK");
    return 0;
}
