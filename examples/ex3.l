%{
int glenCount = 0;
int vowelCount =0;
%}

space	[ ]*
digit	[0-9]
alpha	[a-zA-Z]
vowel	[aeiou]
cons	[^aeiou]
number -?[0-9]+
first	Glen
phone	{digit}{7}
age	{digit}{1,2}
info	{first}{space}{phone}{space}{age}
%%
{info}	{printf("Info!");}
{first}	{glenCount++; printf("Now at %d glens\n",glenCount);}
{vowel}	{vowelCount++; printf("Vowel!");}
.	;
%%

main()
{
	yylex();
        printf("%d %d\n",glenCount, vowelCount);

}
