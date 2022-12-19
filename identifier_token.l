/* Declaration Section */
%{

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char keywords[10][10];
char *keyword_token;
int keyword_index = 0;
int keyword_present = 0;

char separators[10][10];
char *separator_token;
int separator_index = 0;
int separator_present = 0;

char identifiers[10][10];
char *identifier_token;
int identifier_index = 0;
int identifier_present = 0;

char operators[10][10];
char *operator_token;
int operator_index = 0;
int operator_present = 0;

char integers[10][10];
char *integer_token;
int integer_index = 0;
int integer_present = 0;

char punctuation[10][10];
char *punctuation_token;
int punctuation_index = 0;
int punctuation_present = 0;

char strings[10][10];
char *string_token;
int string_index = 0;
int string_present = 0;

char comments[10][10];
char *comment_token;
int comment_index = 0;


%}


/* Rules Section */
%%
"int"|"main"|"for"|"while"|"cout"|"return" {    /* keywords */
    /* set current token to keyword_token */
    keyword_token = ("%s", yytext);

    /* check if any elements in the array contain the current keyword_token */
    for (int i = 0; i < sizeof(keywords); ++i) {
        if (strcmp(keywords[i], keyword_token) == 0) {
            keyword_present = 1;
            break;
        }
    }

    /* if there were no matching elements, add the current keyword_token to the array */
    if (keyword_present == 0) {
        strcpy(keywords[keyword_index], keyword_token);

        /* increment keyword_index by 1 */
        keyword_index++;
    }
    /* reset keyword_present to 0 */
    keyword_present = 0;
}                           


"("|")"|"{"|"}" {                               /* separators */
    /* set current token to separator_token*/
    separator_token = ("%s", yytext);

    /* check if any elements in the array contain the current separator_token */
    for (int i = 0; i < sizeof(separators); ++i) {
        if (strcmp(separators[i], separator_token) == 0) {
            separator_present = 1;
            break;
        }
    }

    /* if there were no matching elements, add the current separator_token to the array */
    if (separator_present == 0) {
        strcpy(separators[separator_index], separator_token);

        /* increment separator_index by 1 */
        separator_index++;
    }

    /* reset separator_present to 0 */
    separator_present = 0;
}                         

 
"i" {                                           /* identifiers */ 
    /* set current token to identifier_token*/
    identifier_token = ("%s", yytext);

    /* check if any elements in the array contain the current identifier_token */
    for (int i = 0; i < sizeof(identifiers); ++i) {
        if (strcmp(identifiers[i], identifier_token) == 0) {
            identifier_present = 1;
            break;
        }
    }

    /* if there were no matching elements, add the current identifier_token to the array */
    if (identifier_present == 0) {
        strcpy(identifiers[identifier_index], identifier_token);

        /* increment identifier_index by 1 */
        identifier_index++;
    }

    /* reset identifier_present to 0 */
    identifier_present = 0;
}     


"="|"<="|"=="|"+"|"<<" {                        /* operators */
    /* set current token to operator_token */
    operator_token = ("%s", yytext);

    /* check if any elements in the array contain the current operator_token */
    for (int i = 0; i < sizeof(operators); ++i) {
        if (strcmp(operators[i], operator_token) == 0) {
            operator_present = 1;
            break;
        }
    }

    /* if there were no matching elements, add the current operator_token to the array */
    if (operator_present == 0) {
        strcpy(operators[operator_index], operator_token);

        /* increment operator_index by 1 */
        operator_index++;
    }

    /* reset operator_present to 0 */
    operator_present = 0;
}


"0"|"1"|"22"|"100" {                            /* integers */
    /* set current token to integer_token */
    integer_token = ("%s", yytext);

    /* check if any elements in the array contain the current operator_token */
    for (int i = 0; i < sizeof(integers); ++i) {
        if (strcmp(integers[i], integer_token) == 0) {
            integer_present = 1;
            break;
        }
    }

    /* if there were no matching elements, add the current integer_token to the array */
    if (integer_present == 0) {
        strcpy(integers[integer_index], integer_token);

        /* increment integer_index by 1 */
        integer_index++;
    }
    
    /* reset integer_present to 0 */
    integer_present = 0;

    }


"!"|";"|"\"" {                                   /* punctuation */
    /* set current token to punctuation_token */
    punctuation_token = ("%s", yytext);

    /* check if any elements in the array contain the current punctuation_token */
    for (int i = 0; i < sizeof(punctuation); ++i) {
        if (strcmp(punctuation[i], punctuation_token) == 0) {
            punctuation_present = 1;
            break;
        }
    }

    /* if there were no matching elements, add the current punctuation_token to the array */
    if (punctuation_present == 0) {
        strcpy(punctuation[punctuation_index], punctuation_token);

        /* increment punctuation_index by 1 */
        punctuation_index++;
    }

    /* reset punctuation_present to 0 */
    punctuation_present = 0;

}  


"Hello"|"World" {                                  /* strings */
    /* set current token to string_token */
    string_token = ("%s", yytext);

    /* check if any elements in the array contain the current string_token */
    for (int i = 0; i < sizeof(strings); ++i) {
        if (strcmp(strings[i], string_token) == 0) {
            string_present = 1;
            break;
        }
    }

    /* if there were no matching elements, add the current string_token to the array */
    if (string_present == 0) {
        strcpy(strings[string_index], string_token);

        /* increment string_index by 1 */
        string_index++;
    }

    /* reset string_present to 0 */
    string_present = 0;
  
}

"//print out" {                                   /* comment */
    /* set current token to comment_token */
    comment_token = ("%s", yytext);

    /* no need to check for duplicates as there is only 1 comment */
    /* add the current comment_token to the array */
    strcpy(comments[comment_index], comment_token);
}

[ \t\n]                                     /* ignore blanks, tabs, and newlines */

%%


/* User Code Section */
int yywrap(){
    return 1;
}

/* function to print contents of the array */
void print_lexemes(char lexeme_array[10][10], int n) {
    for (int i = 0; i < n; ++i) {
        if (i < n - 1) {
            printf("%s, ", lexeme_array[i]);
        } else {
            printf("%s\n", lexeme_array[i]);
        }
    }
}

int main(int argc, char **argv){

    char fname[100];
    printf("\nEnter the name of the file: ");
    scanf("%s", fname);
    yyin=fopen(fname, "r+");
    yylex();


    printf("     Tokens    |               Lexemes            \n");
    printf("----------------------------------------------------\n");

    /* print keywords */
    printf("Keyword        | ");
    print_lexemes(keywords, 6);

    /* print separators */
    printf("Separator      | ");
    print_lexemes(separators, 4);

    /* print identifier */
    printf("Identifier     | ");
    printf("%s\n", identifiers[0]);

    /* print operators */
    printf("Operator       | ");
    print_lexemes(operators, 5);

    /* print integers */
    printf("Integer        | ");
    print_lexemes(integers, 4);

    /* print punctuation */
    printf("Punctuation    | ");
    print_lexemes(punctuation, 3); 

    /* print strings */
    printf("String         | ");
    print_lexemes(strings, 2);

    /* print comment */
    printf("Comment        | ");
    printf("%s", comments[0]);

    return 0;
}
