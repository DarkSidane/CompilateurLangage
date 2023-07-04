arith : 
	yacc -d lang_expr.y
	flex lang_expr.l
	gcc -o lang_expr y.tab.c arbres.c traduction.c lex.yy.c -lfl
	./lang_expr
