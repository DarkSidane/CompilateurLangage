#include <stdio.h>
#include <stdlib.h>
// Structure pour représenter un nœud de l'arbre
typedef struct Node {
	int token;              // Étiquette représentant le token de commande
	int numChildren;        // Nombre de fils du nœud
	struct Node** children; // Tableau de pointeurs vers les fils
} Node;

// Fonction pour créer un nouveau nœud avec l'étiquette donnée et le nombre de fils spécifié
Node* createNode(int token, int numChildren) 
{
	Node* newNode = (Node*)malloc(sizeof(Node));
	newNode->token = token;
	newNode->numChildren = numChildren;
	newNode->children = (Node**)malloc(numChildren * sizeof(Node*));
	return newNode;
}

// Fonction pour afficher l'arbre syntaxique en ordre préfixe (parcours en profondeur)
void printSyntaxTreeRec(Node* root) {
	if (root != NULL) {
		printf("%d, ", root->token);
		printf("(");
		for (int i = 0; i < root->numChildren; i++) 
		{
			printSyntaxTreeRec(root->children[i]);
			if (i < root->numChildren - 1) 
			{
				printf(", ");
			}
		}
		printf(")");
	}
}
void printSyntaxTree(Node* root)
{
	printf("(");
	printSyntaxTreeRec(root);
	printf(") \n");
}
void printFichier(int token)
{
	FILE* fichier = NULL;
	fichier = fopen("fichier.txt", "a");
	if (fichier != NULL)
	{
		fprintf(fichier, "%d\n", token);
		fclose(fichier);
	}
}

int* copieSyntaxTree(Node *root, int* listeToken, int i)
{
	if (root != NULL) {
	printf("ok");
		listeToken[i] = root->token;
		i++;
		for (int j = 0; j < root->numChildren; j++)
		{
			copieSyntaxTree(root->children[j], listeToken, i);
		}
	}
	return listeToken;
}

/*
int main() {
	// Construction de l'arbre syntaxique
	Node* root = createNode(1, 3);  // Noeud racine avec l'étiquette 1 et 3 fils (exemple)
	root->children[0] = createNode(2, 0);
	root->children[1] = createNode(3, 2);
	root->children[1]->children[0] = createNode(4, 0);
	root->children[1]->children[1] = createNode(5, 0);
	root->children[2] = createNode(6, 0);

	// Affichage de l'arbre syntaxique
	printf("Arbre syntaxique : ");
	printSyntaxTree(root);
	printf("\n");

	// Libération de la mémoire occupée par l'arbre
	for (int i = 0; i < root->numChildren; i++) {
		free(root->children[i]);
	}
	free(root->children);
	free(root);

	return 0;
}
*/
