CC = gcc -std=gnu99 -g
INCDIR  = .
OFILES = fisher.o fexact.o

fisher : $(OFILES)
	$(CC) -static -o $@ $(OFILES)  -lgsl -lm

.c.o :
	$(CC) -I$(INCDIR) -c -o $@ $<

clean :
	\rm -f $(OFILES)
