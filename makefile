CC=gcc
CFLAGS=-I.

parallel_min_max : utils.o find_min_max.o utils.h find_min_max.h
	$(CC) -o parallel_min_max utils.o find_min_max.o parallel_min_max.c $(CFLAGS)

utils.o : utils.h
	$(CC) -o utils.o -c utils.c $(CFLAGS)

lib_sum.o : lib_sum.h
	$(CC) -o lib_sum.o -c lib_sum.c $(CFLAGS)

find_min_max.o : utils.h find_min_max.h
	$(CC) -o find_min_max.o -c find_min_max.c $(CFLAGS)

process_memory : utils.h find_min_max.h
	$(CC) -o process_memory process_memory.c $(CFLAGS)

parallel_sum : utils.h find_min_max.h lib_sum.o utils.o
	$(CC) -o parallel_sum utils.o lib_sum.o parallel_sum.c -pthread

clean :
	rm utils.o find_min_max.o parallel_min_max lib_sum.o parallel_sum

all : parallel_min_max process_memory parallel_sum
    