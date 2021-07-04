%{
#include <stdio.h>
%}

%%
[0-9]+	printf("number\n");
[a-z]+ 	printf("word\n");
%%

