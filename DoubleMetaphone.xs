#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#include "double_metaphone.h"

static int
not_here(char *s)
{
    croak("%s not implemented on this architecture", s);
    return -1;
}

static double
constant(char *name, int arg)
{
    errno = 0;
    switch (*name) {
    }
    errno = EINVAL;
    return 0;

not_there:
    errno = ENOENT;
    return 0;
}


MODULE = Text::DoubleMetaphone		PACKAGE = Text::DoubleMetaphone		


double
constant(name,arg)
	char *		name
	int		arg


void
double_metaphone(str)
	char *	str
        PREINIT:
        char *codes[2];
        SV   *sv1;
        SV   *sv2;
        PPCODE:
        DoubleMetaphone(str, codes);
        sv1 = sv_newmortal();
        sv_usepvn((SV *) sv1, codes[0], strlen(codes[0])); 
        XPUSHs(sv1);      

        if ((GIMME == G_ARRAY) && strcmp(codes[0], codes[1])) 
          {
            sv2 = sv_newmortal();
            sv_usepvn((SV *) sv2, codes[1], strlen(codes[1])); 
            XPUSHs(sv2);
          } 
        else 
          {
            free(codes[1]);
          }
