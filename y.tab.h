#ifndef _yy_defines_h_
#define _yy_defines_h_

#define INTEGER 257
#define IDENTIFIER 258
#define TRUE 259
#define FALSE 260
#define AND 261
#define OR 262
#define DO 263
#define SKIP 264
#define COMMA 265
#define NOT 266
#define NEQ 267
#define INFE 268
#define INF 269
#define SUP 270
#define SUPE 271
#define LPAREN 272
#define RPAREN 273
#define EOL 274
#define EQ 275
#define IF 276
#define ELSE 277
#define THEN 278
#define WHILE 279
#define ASS 280
#define END 281
#define LACCOL 282
#define RACCOL 283
#ifdef YYSTYPE
#undef  YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
#endif
#ifndef YYSTYPE_IS_DECLARED
#define YYSTYPE_IS_DECLARED 1
typedef union YYSTYPE 
{
	int int_val;
	struct Node* arbre_val;
} YYSTYPE;
#endif /* !YYSTYPE_IS_DECLARED */
extern YYSTYPE yylval;

#endif /* _yy_defines_h_ */
