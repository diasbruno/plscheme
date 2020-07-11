PG_INCLUDEDIR=`pg_config --includedir-server`
PG_PKGLIBDIR=`pg_config --pkglibdir`

plschemeu.o: plscheme.c
	cc -g -Wall -fpic -c \
		-I /usr/include/guile/3.0/ \
		-DMODULE_DIR=\"$(PG_PKGLIBDIR)\" \
		-DMAX_CACHE_SIZE=64 \
		-DSAFE_R5RS \
		-I$(PG_INCLUDEDIR) \
		-o $@ $<
# You can also use a -DSAFE_R5RS flag to get a trusted PL.

plschemeu.so: plscheme.o
	cc -lguile -shared -lpthread -o $@ $<
