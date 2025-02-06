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
