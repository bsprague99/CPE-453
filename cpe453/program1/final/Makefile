PLAT=$(shell uname -i)
LWP-EX=liblwp-$(PLAT).a
LWP=liblwp.a

all: $(LWP)
examples: $(LWP-EX) lwp.h numbersmain-ex numbersmain

numbersmain: numbersmain.c lwp.h $(LWP)
	cc -Wall -Werror -g -o $@ $< $(LWP)

fib: fibonacci.c lwp.h $(LWP)
	cc -Wall -Werror -g -o $@ $< $(LWP)

numbersmain-ex: numbersmain.c lwp.h $(LWP-EX)
	cc -Wall -Werror -g -o $@ $< $(LWP-EX)

$(LWP): lwp.o
	ar r $@ lwp.o
	ranlib $@

lwp.o: lwp.c lwp.h
	cc -Wall -Werror -g -c -o $@ $<
	cc -S $<

clean:
	-rm -f numbersmain $(LWP) numbersmain-ex fib
	-rm -f lwp.s
	-rm -f *.o
