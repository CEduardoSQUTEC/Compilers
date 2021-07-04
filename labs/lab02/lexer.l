%{
#include <stdio.h>

int n_lines = 1;

typedef struct token_elem {
	char *type_;
	char *value_;
	struct token_elem *next;
} token_elem;

typedef struct token_list {
	int size;
	token_elem *head;
	token_elem *tail;
} token_list;

token_list list;

void push_back_token_list(char *type, char *value) {

  	int type_len = strlen(type);
    int value_len = strlen(value);

	token_elem *token = malloc(sizeof(token_elem));

	token->type_ = malloc(sizeof(char) * type_len);
  	token->value_ = malloc(sizeof(char) * value_len);

    strcpy(token->type_, type);
	strcpy(token->value_, value);

	if (list.size == 0) list.head = list.tail = token;
	else {
		list.tail->next = token;
		list.tail = token;
	}
	++list.size;
}

%}

%%
[=]									{
									printf("<ASSIGN> ");
									push_back_token_list("ASSIGN", yytext);
									}
[<]									{
									printf("<RELOP LT> ");
									push_back_token_list("RELOP", yytext);
									}
[<][=]								{
									printf("<RELOP LE> ");
									push_back_token_list("RELOP", yytext);
									}
[>]									{
									printf("<RELOP GT> ");
									push_back_token_list("RELOP", yytext);
									}
[>][=]								{
									printf("<RELOP GE> ");
									push_back_token_list("RELOP", yytext);
									}
[=][=] 								{
									printf("<RELOP EQ> ");
									push_back_token_list("RELOP", yytext);
									}
if									{
									printf("<IF> ");
									push_back_token_list("IF", yytext);
									}
else								{
									printf("<ELSE> ");
									push_back_token_list("ELSE", yytext);
									}
[' ']								{;}
[(]									{
									printf("<PARBEGIN> ");
									push_back_token_list("PARBEGIN", yytext);
									}
[)]									{
									printf("<PAREND> ");
									push_back_token_list("PAREND", yytext);
									}
[&][&]								{
									printf("<AND> ");
									push_back_token_list("AND", yytext);
									}
[|][|]								{
									printf("<OR> ");
									push_back_token_list("OR", yytext);
									}
[a-zA-z][a-zA-z0-9]* 				{
									printf("<ID %s> ", yytext);
									push_back_token_list("ID", yytext);
									}
[0-9]*(\.[0-9]*)?([Ee][+-]?[0-9]+)?	{
									printf("<NUM %s> ", yytext);
									push_back_token_list("NUM", yytext);
									}
[+]									{
									printf("<OP SUM> ");
									push_back_token_list("OP", yytext);
									}
[-]									{
									printf("<OP MINUS> ");
									push_back_token_list("OP", yytext);
									}
[*] 								{
									printf("<OP MUL> ");
									push_back_token_list("OP", yytext);
									}
[/] 								{
									printf("<OP DIV> ");
									push_back_token_list("OP", yytext);
									}
[%] 								{
									printf("<OP MOD> ");
									push_back_token_list("OP", yytext);
									}
\n									{
									printf("\n"); n_lines++;
									}
.									{
									printf("Error en linea %d, caracter \'%s\' no soportado. ", n_lines, yytext);
									}
%%

int yywrap(){}
int main(int argc, char **argv) {

list.size = 0;
list.head = NULL;
list.tail = NULL;
	yylex();
	printf("Token list\n");
	token_elem *it = list.head;
	while (it != NULL) {
		printf("<%s \'%s\'>\n", it->type_, it->value_);
		it = it->next;
	}
}

