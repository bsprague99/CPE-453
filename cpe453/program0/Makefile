CC = gcc -std=gnu99
CFLAGS = -g -Wall -pedantic -ggdb -Wextra -std=c99

all: fork_loop who_runs_first

fork_loop: fork_loop.c
		$(CC) $(CFLAGS) -o fork_loop fork_loop.c

fork_loop.c:
		$(CC) $(CFLAGS) -c fork_loop.c

who_runs_first: who_runs_first.c
		$(CC) $(CFLAGS) -o who_runs_first who_runs_first.c

who_runs_first.c:
		$(CC) $(CFLAGS) -c who_runs_first.c

clean:
		rm -f fork_loop
		rm -f who_runs_first