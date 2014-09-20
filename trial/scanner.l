%{
	int mylinenum = 0;
%}
ws		[ \t]+
letter_		[a-zA-Z_]
digit		[0-9]
hex		[(0X|0x)[0-9A-F]]
double		{digit}+\.E(+|-){digit}+
%%
{ws}		/*skip spaces and tabs*/

"/*"	{
 int c;

 while((c = yyinput()) != 0)
 {
 	if(c == '\n')
		++mylinenum;
	else if (c == '*')
	{
		if((c == yyinput()) == '/')
			break;
		else 
			unput(c);
	}
 }
}

{digit} 			return TOKNUMBER;
{letter}|{letter|digits}*	return TOKIDENTIFIER;
{true|false}			return TOKBOOL;
{digit|hex}			return TOKINTEGER_CONST;

%%
