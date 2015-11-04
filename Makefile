GSL=$(HOME)/gsl

CC=gcc -std=gnu99 -g
OFILES = fisher.o fexact.o
GSLINC = -I$(GSL)/include
GSLLIB = -L$(GSL)/lib

all : fisher


fisher : $(OFILES)
	$(CC) -static $(GSLLIB) -o $@ $(OFILES) -lgsl -lgslcblas -lm
.c.o :
	$(CC) $(GSLINC) -c -o $@ $<

clean :
	\rm -f $(OFILES)

