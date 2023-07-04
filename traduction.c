/*
 *  traduction.c 
 *
 * Sidane Alp et Vlad Alexandru Tanasov 
 *  25/06/2023
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "traduction.h"
#include "uniteLexicale.h"

char* bool_trad(int bool_token)
{
	switch (bool_token)
	{
		case TOKEN_TRUE:
			return "true";
		case TOKEN_FALSE:
			return "false";
		case TOKEN_NOT:
			return "not";
		case TOKEN_AND:
			return "and";
		case TOKEN_OR:
			return "or";
		case TOKEN_EQ:
			return "=";
		case TOKEN_NEQ:
			return "<>";
		case TOKEN_BOOL:
			return "bool";
		case TOKEN_INF:
			return "<";
		case TOKEN_SUPE:
			return ">=";
		case TOKEN_SUP:
			return ">";
		case TOKEN_INFE:
			return "<=";
	
		default:
			return "error";
	}
}
char* cmd_trad(int cmd_token)
{
	switch (cmd_token)
	{
		case TOKEN_SKIP:
			return "skip";
		case TOKEN_IF: 
			return "if";
		case TOKEN_THEN:
			return "then";
		case TOKEN_ELSE:
			return "else";
		case TOKEN_END :
			return "end";
		case TOKEN_WHILE:
			return "while";
		case TOKEN_DO:
			return "do";
		case TOKEN_ASS:
			return ":=";
		case TOKEN_LIST:
			return "list";
		case TOKEN_COMP :
			return "comp";
		case TOKEN_LACCOL :
			return "{";
		case TOKEN_RACCOL :
			return "}";
		case TOKEN_COMMA:
			return ";";
		case TOKEN_LPAREN :
			return "(";
		case TOKEN_RPAREN :
			return ")";
		default :
			return "error";
	}
}
char* arith_trad(int arith_token)
{
	switch(arith_token)
	{
		case TOKEN_PLUS :
			return "+";
		case TOKEN_MINUS :
			return "-";
		case TOKEN_MULT :
			return "*";		
		case TOKEN_MOD:
			return "%";		
		case TOKEN_IDENTIFIER:
			return "Variable";		
		case TOKEN_INTEGER:
			return "Entier";		
		default :
			return "error";
	}
}


char* traduction(int token)
{
	switch (token)
	{
		case TOKEN_TRUE:
			return "true";
		case TOKEN_FALSE:
			return "false";
		case TOKEN_NOT:
			return "not";
		case TOKEN_AND:
			return "and";
		case TOKEN_OR:
			return "or";
		case TOKEN_EQ:
			return "=";
		case TOKEN_NEQ:
			return "<>";
		case TOKEN_BOOL:
			return "bool";
		case TOKEN_INF:
			return "<";
		case TOKEN_SUPE:
			return ">=";
		case TOKEN_SUP:
			return ">";
		case TOKEN_INFE:
			return "<=";
		case TOKEN_SKIP:
			return "skip";
		case TOKEN_IF: 
			return "if";
		case TOKEN_THEN:
			return "then";
		case TOKEN_ELSE:
			return "else";
		case TOKEN_END :
			return "end";
		case TOKEN_WHILE:
			return "while";
		case TOKEN_DO:
			return "do";
		case TOKEN_ASS:
			return ":=";
		case TOKEN_LIST:
			return "list";
		case TOKEN_COMP :
			return "comp";
		case TOKEN_LACCOL :
			return "{";
		case TOKEN_RACCOL :
			return "}";
		case TOKEN_COMMA:
			return ";";
		case TOKEN_LPAREN :
			return "(";
		case TOKEN_RPAREN :
			return ")";
		case TOKEN_PLUS :
			return "+";
		case TOKEN_MINUS :
			return "-";
		case TOKEN_MULT :
			return "*";		
		case TOKEN_MOD:
			return "%";		
		case TOKEN_IDENTIFIER:
			return "Variable";		
		case TOKEN_INTEGER:
			return "Entier";		
		default :
			return "error";
	}
}

