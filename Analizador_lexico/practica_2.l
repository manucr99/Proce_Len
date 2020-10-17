{%
#include <stdlib.h>
#include <string.h>
#include "tokens.h"

int num_lineas = 1;
%}

%x ml_comment

LETRA[a-zA-Z]
DIGITO[0-9]
ENTERO {DIGITO}+
REAL {ENTERO}.{ENTERO}
IDENTIFICADOR {LETRA}({DIGITO}|{LETRA})*


%%
\n                          num_lineas++;
[ \t]                       ;

{IDENTIFICADOR}             return IDENTIFICADOR;
.                           printf("Simbolo erroneo: '%s' en linea: %d\n", yytext, numlinea);
%%