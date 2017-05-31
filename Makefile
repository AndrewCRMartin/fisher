# Change to wherever you put GSL
GSLDIR  = ${HOME}/lib/gsl

CC      = gcc -std=gnu99 -g
OFILES  = fisher.o fexact.o
GSLINC  = $(GSLDIR)/include
GSLLIB  = $(GSLDIR)/lib
GSLFILE = $(GSLDIR)/lib/libgsl.a

all : $(GSLFILE) fisher

gsl : $(GSLFILE)

fisher : $(OFILES)
	$(CC) -L$(GSLLIB) -o $@ $(OFILES) -lgsl -lgslcblas -lm
.c.o :
	$(CC) -I$(GSLINC) -c -o $@ $<

clean :
	\rm -f $(OFILES)

$(GSLFILE) :
	./buildgsl.sh $(GSLDIR)

install : all
	mkdir -p ${HOME}/bin
	cp fisher ${HOME}/bin
