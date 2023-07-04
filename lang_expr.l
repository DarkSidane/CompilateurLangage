/*
 *  lang_expr.l
 *
 * Sidane Alp et Vlad Alexandru Tanasov 
 *  5/06/2023
 */


%{
#include "y.tab.h"
#include "arbres.h"
#include "uniteLexicale.h"
#include "traduction.h"
%}

%%

"true" { printFichier(TOKEN_TRUE); return TRUE; }
"false" {printFichier(TOKEN_FALSE); return FALSE; }

"or" {printFichier(TOKEN_OR); return OR; }
"and" {printFichier(TOKEN_AND); return AND; }
"not" {printFichier(TOKEN_NOT); return NOT; }
"==" { printFichier(TOKEN_EQ); return EQ; }
"!=" { printFichier(TOKEN_NEQ); return NEQ; }

"if" {printFichier(TOKEN_IF);return IF;}
"else" {printFichier(TOKEN_ELSE);return ELSE;}
"end" {printFichier(TOKEN_END); return END;}  
"then" {printFichier(TOKEN_THEN); return THEN;}
"while" {printFichier(TOKEN_WHILE); return WHILE;}
"skip" {printFichier(TOKEN_SKIP); return SKIP;}
":=" {printFichier(TOKEN_ASS); return ASS;}
"do" {printFichier(TOKEN_DO); return DO;}

"<=" {printFichier(TOKEN_INFE); return INFE;}
"<" { printFichier(TOKEN_INF); return INF;}
">=" {printFichier(TOKEN_SUPE); return SUPE;}
">" {printFichier(TOKEN_SUP); return SUP;}

";" {printFichier(TOKEN_COMMA); return COMMA;}

[0-9]+ { printFichier(TOKEN_INTEGER); yylval.int_val = atoi(yytext); return INTEGER; }
[\n]   { return EOL; }
[\t ]  { /* Ignore les espaces  */ }
[a-zA-Z][0-9]?[0-9]? { printFichier(TOKEN_IDENTIFIER); return IDENTIFIER;}
[(]    { printFichier(TOKEN_LPAREN); return LPAREN; }
[)]    { printFichier(TOKEN_RPAREN); return RPAREN; }
[{]    { printFichier(TOKEN_LACCOL); return LACCOL; }
[}]    { printFichier(TOKEN_RACCOL); return RACCOL; }

%%

int yywrap() {
    return 1;
}
