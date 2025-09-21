# Variables
CC = gcc
CFLAGS = -I./include -Wall -fPIC
LDFLAGS = -L./lib -lmyutils
SRC = src/main.c
OBJ = obj/main.o
TARGET = bin/client_dynamic

# Default target
all: $(TARGET)

# Build main object file
obj/main.o: src/main.c
	$(CC) $(CFLAGS) -c $< -o $@

# Link dynamic executable
$(TARGET): obj/main.o lib/libmyutils.so
	$(CC) obj/main.o -o $(TARGET) $(LDFLAGS)

# Build shared library
lib/libmyutils.so: obj/mystrfunctions.o obj/myfilefunctions.o
	$(CC) -shared -o lib/libmyutils.so obj/mystrfunctions.o obj/myfilefunctions.o

# Compile other objects with -fPIC
obj/mystrfunctions.o: src/mystrfunctions.c
	$(CC) $(CFLAGS) -c $< -o $@

obj/myfilefunctions.o: src/myfilefunctions.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f obj/*.o bin/* lib/*.so

