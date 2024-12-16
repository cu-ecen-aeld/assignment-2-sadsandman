# Compiler prefix for cross-compilation (empty by default for native build)
CROSS_COMPILE ?=

# Compiler and flags
CC := $(CROSS_COMPILE)gcc

# Targets and dependencies
all: writer

writer: writer.o
	$(CC) $(CFLAGS) -o writer writer.o

writer.o: writer.c
	$(CC) $(CFLAGS) -c writer.c -o writer.o

clean:
	rm -rf writer writer.o
