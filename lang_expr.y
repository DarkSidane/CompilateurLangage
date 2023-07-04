/*
 *  lang_expr.y
 *
 * Sidane Alp et Vlad Alexandru Tanasov 
 *  25/06/2023
 */
/* Exemples d'expressions valides :
 * a := 5;
 * while true do {a:= 10; skip;} end
 * if 20 >= 10 then skip end
 */

%{
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include "arbres.h"
#include "traduction.h"
#include "uniteLexicale.h"
	extern int yylex();
	void yyerror(const char *s);
	int* listetoken; 
	int taille;
	bool expression_valid = false;
%}

%union 
{
	int int_val;
	struct Node* arbre_val;
}

%token <int_val> INTEGER
%token IDENTIFIER

%token TRUE FALSE 
%token AND OR DO
%token SKIP COMMA 
%token NOT NEQ
%token INFE INF SUP SUPE
%token LPAREN RPAREN
%token EOL EQ 
%token IF ELSE THEN WHILE ASS SKIP END
%token LACCOL RACCOL
%left AND OR 
%left NOT
%left EOL 
%left INFE INF SUP SUPE
%left EQ NEQ

// Déclaration des types
%type <arbre_val> exp_list
%type <arbre_val> exp
%type <arbre_val> bool
%%

input: 
	| input line
	;

line: 
	EOL
	| exp EOL
	{
		expression_valid = true;
		printf("Expression valide\n");
	}
	| error EOL
	{
		expression_valid = false;
		printf("Expression invalide\n");
		yyerrok;
	}
	;

bool: 
	TRUE
	{
		$$ = createNode(TOKEN_TRUE, 0);
		printSyntaxTree($$);
	}
	| FALSE
	{
		$$ = createNode(TOKEN_FALSE, 0);
		printSyntaxTree($$);
	}
	| INTEGER INF INTEGER
	{
		$$ = createNode(TOKEN_INF, 2);
		$$->children[0] = createNode(TOKEN_INTEGER, 0);
		$$->children[1] = createNode(TOKEN_INTEGER, 0);
	}
	| INTEGER INFE INTEGER
	{
		$$ = createNode(TOKEN_INFE, 2);
		$$->children[0] = createNode(TOKEN_INTEGER, 0);
		$$->children[1] = createNode(TOKEN_INTEGER, 0);
	}
	| INTEGER SUPE INTEGER
	{
		$$ = createNode(TOKEN_SUPE, 2);
                $$->children[0] = createNode(TOKEN_INTEGER, 0);
                $$->children[1] = createNode(TOKEN_INTEGER, 0);
	}
	| INTEGER SUP INTEGER
	{
		$$ = createNode(TOKEN_SUP, 2);
		$$->children[0] = createNode(TOKEN_INTEGER, 0);
		$$->children[1] = createNode(TOKEN_INTEGER, 0);
	}
	| IDENTIFIER INF IDENTIFIER
	{
		$$ = createNode(TOKEN_INF, 2);
		$$->children[0] = createNode(TOKEN_IDENTIFIER, 0);
		$$->children[1] = createNode(TOKEN_IDENTIFIER, 0);
	}
	| IDENTIFIER INFE IDENTIFIER
	{
		$$ = createNode(TOKEN_INFE, 2);
		$$->children[0] = createNode(TOKEN_IDENTIFIER, 0);
		$$->children[1] = createNode(TOKEN_IDENTIFIER, 0);
	}
	| IDENTIFIER SUPE IDENTIFIER
	{
		$$ = createNode(TOKEN_SUPE, 2);
		$$->children[0] = createNode(TOKEN_IDENTIFIER, 0);
		$$->children[1] = createNode(TOKEN_IDENTIFIER, 0);
	}
	| IDENTIFIER SUP IDENTIFIER
	{
		$$ = createNode(TOKEN_SUP, 2);
		$$->children[0] = createNode(TOKEN_IDENTIFIER, 0);
		$$->children[1] = createNode(TOKEN_IDENTIFIER, 0);
	}
	| INTEGER INF IDENTIFIER
	{
		$$ = createNode(TOKEN_INF, 2);
		$$->children[0] = createNode(TOKEN_INTEGER, 0);
		$$->children[1] = createNode(TOKEN_IDENTIFIER, 0);
	}
	| IDENTIFIER INF INTEGER 
	{
		$$ = createNode(TOKEN_INF, 2);
		$$->children[0] = createNode(TOKEN_IDENTIFIER, 0);
		$$->children[1] = createNode(TOKEN_INTEGER, 0);
	}
	| INTEGER INFE IDENTIFIER
	{
		$$ = createNode(TOKEN_INFE, 2);
		$$->children[0] = createNode(TOKEN_INTEGER, 0);
		$$->children[1] = createNode(TOKEN_IDENTIFIER, 0);
	}
	| IDENTIFIER SUPE INTEGER 
	{
		$$ = createNode(TOKEN_SUPE, 2);
		$$->children[0] = createNode(TOKEN_IDENTIFIER, 0);
		$$->children[1] = createNode(TOKEN_INTEGER, 0);
	}
	| IDENTIFIER INFE INTEGER 
	{
		$$ = createNode(TOKEN_INFE, 2);
		$$->children[0] = createNode(TOKEN_IDENTIFIER, 0);
		$$->children[1] = createNode(TOKEN_INTEGER, 0);
	}
	| INTEGER SUPE IDENTIFIER
	{
		$$ = createNode(TOKEN_SUPE, 2);
		$$->children[0] = createNode(TOKEN_INTEGER, 0);
		$$->children[1] = createNode(TOKEN_IDENTIFIER, 0);
	}
	| IDENTIFIER SUP INTEGER 
	{
		$$ = createNode(TOKEN_SUP, 2);
		$$->children[0] = createNode(TOKEN_IDENTIFIER, 0);
		$$->children[1] = createNode(TOKEN_INTEGER, 0);
	}
	| bool OR bool
	{
		$$ = createNode(TOKEN_OR, 2);
		$$->children[0] = $1; 
		$$->children[1] = $3;
	}
	| bool AND bool
	{
		$$ = createNode(TOKEN_AND, 2);
		$$->children[0] = $1; 
		$$->children[1] = $3; 
	}
	| bool EQ bool
	{
		$$ = createNode(TOKEN_EQ, 2);
		$$->children[0] = $1; 
		$$->children[1] = $3; 
	}
	| bool NEQ bool
	{
		$$ = createNode(TOKEN_NEQ, 2);
		$$->children[0] = $1; 
		$$->children[1] = $3; 
	}
	| NOT bool
	{
		$$ = createNode(TOKEN_NOT, 1);
		$$->children[0] = $2; 
	}
	| LPAREN bool RPAREN
	{
		$$ = createNode(TOKEN_LPAREN, 2);
		$$->children[0] = $2; 
		$$->children[0]->children[0] = createNode(TOKEN_RPAREN, 1); 
	}
	|  
	{
		$$ = NULL;
	}
	;

exp: 	SKIP
	{
		$$ = createNode(TOKEN_SKIP, 1);
		printSyntaxTree($$);
	}
	| IF bool THEN exp ELSE exp END
	{
		$$ = createNode(TOKEN_IF, 3);
		$$->children[0] = $2;
		$$->children[1] = createNode(TOKEN_THEN, 1);
		$$->children[1]->children[0] = $4;
		$$->children[2] = createNode(TOKEN_ELSE, 1);
		$$->children[2]->children[0] = $6;
		$$->children[3] = createNode(TOKEN_END, 0);
		printSyntaxTree($$);
	}
	| bool
	{
		$$ = $1;
		printSyntaxTree($$);
	}
	| IDENTIFIER
	{
		$$ = createNode(TOKEN_IDENTIFIER, 0);
		printSyntaxTree($$);
	}
	| IF bool THEN exp END
	{
		$$ = createNode(TOKEN_IF, 2);
		$$->children[0] = $2;
		$$->children[1] = createNode(TOKEN_THEN, 1);
		$$->children[1]->children[0] = $4;
		$$->children[2] = createNode(TOKEN_END, 0);
		printSyntaxTree($$);
	}
	| WHILE bool DO exp END
	{
		$$ = createNode(TOKEN_WHILE, 2);
		$$->children[0] = $2;
		$$->children[1] = createNode(TOKEN_DO, 1);
		$$->children[1]->children[0] = $4;
		$$->children[2] = createNode(TOKEN_END, 0);
		printSyntaxTree($$);
	}
	| exp COMMA
	{
		$1->children[0] = createNode(TOKEN_COMMA, 0);
		$$ = $1;
		printSyntaxTree($$);
	}
	| LACCOL exp_list RACCOL 
	{
		$$ = createNode(TOKEN_LACCOL, 2); 
		$$->children[0] = $2;
		$$->children[1] = createNode(TOKEN_RACCOL, 1);
		printSyntaxTree($$);
	}
	| IDENTIFIER ASS INTEGER
	{
		$$ = createNode(TOKEN_ASS, 2);
		$$->children[0] = createNode(TOKEN_IDENTIFIER, 0);
		$$->children[1] = createNode(TOKEN_ASS, 0);
		printSyntaxTree($$);
	}
	|
	{
		$$ = NULL;
	}
	;
// Composition séquentielle, réservée pour des accolades
exp_list : exp
	{
		$$ = $1;
		printSyntaxTree($$);
	}
	| exp COMMA exp_list
	{
		$$ = createNode(TOKEN_LIST, 3);
		$$->children[0] = $1;
		$$->children[1] = createNode(TOKEN_COMMA, 1);
		$$->children[1]->children[0] = $3;
		printSyntaxTree($$);
	}
;

%%
int main() 
{
	FILE* fichier = NULL;
	// Vidage du fichier.txt
	fichier = fopen("fichier.txt", "w");
	fclose(fichier);
	yyparse();

	// stockage dans un variable des données stockés dans le fichier.txt
	fichier = fopen("fichier.txt", "r");
	
	fseek(fichier, 0, 2);
	taille = ftell(fichier) / sizeof(int);
	fseek(fichier, 0, 0);

	listetoken = (int *) malloc(taille * sizeof(int));
	printf("\nliste des commandes utilisées : \n");
	for (int i = 0; i < taille; i++)
	{
		fscanf(fichier, "%d", &listetoken[i]); 
	}
	
	fclose(fichier);	
	for (int i = 0; i < taille; i++)
	{
		printf("%s\n", traduction(listetoken[i]));
	}
	return EXIT_SUCCESS;
}

void yyerror(const char *s) 
{
	fprintf(stderr, "Erreur : %s\n", s);
}
