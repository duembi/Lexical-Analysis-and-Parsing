# Lexical-Analysis-and-Parsing

My Language’s Rules:
My language is a bit difficult language because, there are a lot of rules for syntaxs that’s why programmer should be careful.
For example:
-Program starts with “->now<-” and, it should end with ”#sheriff21”
-we can use loop statements , assignment, conditional statements as statements.
-In my language there are 3 types of variables. Int, float and char. We can use them like C language.
-There is a special character for ending of line “::”.
-There are 4 types of basic arithmetic operation. Addition(#+#), subtract(-<-), multiplication(**), division(%%).
- For assignment “=”.
- There are 2 logic operater. And ( ~ ~), Or(||).
- Great equal (>>), small equal(<<), greater than (#>#), smaller than(#>#).



BNF RULES :
<program> ::= FIRST <declarations> <statements> LAST
           | FIRST LAST
<declarations> ::= <declaration>
                | <declaration> <declarations>
<declaration> ::= CATEGORY FIELD
              | CATEGORY FIELD IS_EEEQQUAL <expression> END_OFLINE
<statements> ::= <statement>
              | <statement> <statements>
<statement> ::= <assignment>
            | TERM END_OFLINE
            | <conditional>
            | <still>
            | <seq>
| <print_state>

<assignment> ::= FIELD IS_EEEQQUAL <expression> END_OFLINE
<expression> ::= <const>
             | FIELD
             | <expression> OR <expression>
             | <expression> AND <expression>
             | <expression> THE_GREA_THANN <expression>
             | <expression> GREAEQ <expression>
             | <expression> MORE__LESST <expression>
             | <expression> LEQL <expression>
             | <expression> IS_THAT_EQUAL <expression>
             | <expression> IS_THAT_NOT_EQUAL <expression>
             | <expression> ADD_TOGETHER <expression>
             | <expression> OPP_SUBTRACT_OPP <expression>
             | <expression> PRODUCTION_OPEARATION <expression>
             | <expression> DIVVY_UP <expression>
             | LF_BRA <expression> RG_BRA
<conditional> ::= _UN_LESS_ LEFT_BR <expression> RGT_BR LF_BRA <statements> RG_BRA
              | _UN_LESS_ LEFT_BR <expression> RGT_BR LF_BRA <statements> RG_BRA LEFT LF_BRA <statements> RG_BRA
<still> ::= STILL LEFT_BR <expression> RGT_BR LF_BRA <statements> RG_BRA
<seq> ::= S_E_Q_A LEFT_BR <assignment> <cond_op> END_OFLINE <math_op> RGT_BR LF_BRA <statements> RG_BRA
<print_state> ::= BAS_BAS LEFT_BR FIELD RGT_BR
<const> ::= INTEGER
         | FLOAT
         | CHARACTER
<cond_op> ::= FIELD THE_GREA_THANN <const>
           | FIELD GREAEQ <const>
           | FIELD MORE__LESST <const>
           | FIELD LEQL <const>
           | FIELD IS_THAT_EQUAL <const>
           | FIELD IS_THAT_NOT_EQUAL <const>
           | FIELD THE_GREA_THANN FIELD
           | FIELD GREAEQ FIELD
           | FIELD MORE__LESST FIELD
           | FIELD LEQL FIELD
           | FIELD IS_THAT_EQUAL FIELD
           | FIELD IS_THAT_NOT_EQUAL FIELD
           | <const> THE_GREA_THANN FIELD
           | <const> GREAEQ FIELD
           | <const> MORE__LESST FIELD
           | <const> LEQL FIELD
           | <const> IS_THAT_EQUAL FIELD
           | <const> IS_THAT_NOT_EQUAL FIELD
<math_op> ::= FIELD ADD_TOGETHER <const>
           | FIELD OPP_SUBTRACT_OPP <const>
           | FIELD PRODUCTION_OPEARATION <const>
           | FIELD DIVVY_UP <const>



EBNF RULES:
program ::= FIRST declarations statements LAST
          | FIRST LAST
declarations ::= {declaration}
declaration ::= CATEGORY FIELD
             | CATEGORY FIELD IS_EEEQQUAL expression END_OFLINE
statements ::= {statement}
statement ::= assignment
           | TERM END_OFLINE
           | conditional
           | still
           | seq
           | print_state
assignment ::= FIELD IS_EEEQQUAL expression END_OFLINE
expression ::= const
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
conditional ::= _UN_LESS_ LEFT_BR expression RGT_BR LF_BRA statements RG_BRA
             | _UN_LESS_ LEFT_BR expression RGT_BR LF_BRA statements RG_BRA LEFT LF_BRA statements RG_BRA
still ::= STILL LEFT_BR expression RGT_BR LF_BRA statements RG_BRA
seq ::= S_E_Q_A LEFT_BR assignment cond_op END_OFLINE math_op RGT_BR LF_BRA statements RG_BRA
print_state ::= BAS_BAS LEFT_BR FIELD RGT_BR
const ::= INTEGER
       | FLOAT
       | CHARACTER
cond_op ::= FIELD THE_GREA_THANN const
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
math_op ::= FIELD ADD_TOGETHER const
         | FIELD OPP_SUBTRACT_OPP const
         | FIELD PRODUCTION_OPEARATION const
         | FIELD DIVVY_UP const



LEX FILE :
%{ 					/* DEF */
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%% 		    /* RULE */

int|float|char      return CATEGORY;
->now<-             return FIRST;
#sheriff21          return LAST;

[a-z_][a-z0-9_]*    return FIELD;
"~~"                return AND;
"||"                return OR;
">>"                return GREAEQ;
"<<"                return LEQL;
"#>#"                 return THE_GREA_THANN;
"#<#"                 return MORE__LESST;
"=="                return IS_THAT_EQUAL;
"!="                return IS_THAT_NOT_EQUAL;
"="                 return IS_EEEQQUAL;
"**"                return PRODUCTION_OPEARATION;
"%%"                return DIVVY_UP;
"#+#"                return ADD_TOGETHER;
"-<-"                return OPP_SUBTRACT_OPP;
">ulss<"           return _UN_LESS_;
"left?"             return LEFT;
"still!"            return STILL;
"#sq#"              return S_E_Q_A;
">>basbas<<"           return BAS_BAS;
")})"                 return RG_BRA;
"({("                 return LF_BRA;
"[{["                 return LEFT_BR;

"]}]"                 return RGT_BR;
"::"                 return END_OFLINE;
TERM                return TERM;

[+-]?[0-9]+                 yylval = atoi(yytext); return INTEGER;
[+-]?[0-9]+\\.[0-9]+         yylval = atof(yytext); return FLOAT;
\\'.\\'                       return CHARACTER;

\n                          /* ENDOFFILE */;
[ \t]+                      /* SPACE */;

%%
int yywrap(void) {
    return 1;
}



YACC FİLE :

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



SAMPLE INPUT:

->now<-

int k
int l
int m

char y = a::

k = 4::
l = 5::
m = 7::

>ulss< [{[k == l]}]
({(

	>>basbas<< [{[m]}]
	
)})

>ulss< [{[k != l]}]
({(

	>>basbas<< [{[m]}]
	
	#sq# [{[k = 5:: k #># l:: k -<- 1]}]
	({(
	
		m = m #+# 1 ::
	)})	
	
)})


#sq# [{[k = 12:: k #<# l:: k #+# 1]}]
	({(
	
		>ulss< [{[k != l]}]
	({(
	
		>>basbas<< [{[k]}]
		>>basbas<< [{[l]}]
		>>basbas<< [{[m]}]
		
	)})
	
	
	)})	

>>basbas<< [{[a]}]

#sheriff21





