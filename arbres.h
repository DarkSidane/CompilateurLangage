#ifndef SYNTAX_TREE_H
#define SYNTAX_TREE_H

// Structure pour représenter un nœud de l'arbre
typedef struct Node {
    int token;              // Étiquette représentant le token de commande
    int numChildren;        // Nombre de fils du nœud
    struct Node** children; // Tableau de pointeurs vers les fils
} Node;

// Fonction pour créer un nouveau nœud avec l'étiquette donnée et le nombre de fils spécifié
Node* createNode(int token, int numChildren);
// Fonction pour afficher l'arbre syntaxique en ordre préfixe (parcours en profondeur)
void printSyntaxTree(Node* root);
void printSyntaxTreeRec(Node* root);
int* copieSyntaxTree(Node *root, int* listeToken, int i);
void printFichier(int token);

#endif  // SYNTAX_TREE_H

