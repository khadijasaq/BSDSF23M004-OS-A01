# Directories
SRC = src
OBJ = obj
BIN = bin
LIB = lib
INCLUDE = include

# Files
SRCS = $(SRC)/mystrfunctions.c $(SRC)/myfilefunctions.c $(SRC)/main.c
OBJS = $(OBJ)/mystrfunctions.o $(OBJ)/myfilefunctions.o $(OBJ)/main.o
TARGET = $(BIN)/client_static
LIBRARY = $(LIB)/libmyutils.a

# Compiler
# Variables
CC = gcc
CFLAGS = -I$(INCLUDE)
CFLAGS = -I./include -Wall -fPIC
LDFLAGS = -L./lib -lmyutils
SRC = src/main.c
OBJ = obj/main.o
TARGET = bin/client_dynamic

# Default target
all: $(TARGET)

# Rule to build the static library
$(LIBRARY): $(OBJ)/mystrfunctions.o $(OBJ)/myfilefunctions.o
	ar rcs $(LIBRARY) $^
# Build main object file
obj/main.o: src/main.c
	$(CC) $(CFLAGS) -c $< -o $@

# Link dynamic executable
$(TARGET): obj/main.o lib/libmyutils.so
	$(CC) obj/main.o -o $(TARGET) $(LDFLAGS)

# Compile object files
$(OBJ)/%.o: $(SRC)/%.c
# Build shared library
lib/libmyutils.so: obj/mystrfunctions.o obj/myfilefunctions.o
	$(CC) -shared -o lib/libmyutils.so obj/mystrfunctions.o obj/myfilefunctions.o

# Compile other objects with -fPIC
obj/mystrfunctions.o: src/mystrfunctions.c
$(CC) $(CFLAGS) -c $< -o $@

# Link main with library
$(TARGET): $(OBJ)/main.o $(LIBRARY)
	$(CC) $^ -o $@ -L$(LIB) -lmyutils
obj/myfilefunctions.o: src/myfilefunctions.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ)/*.o $(TARGET) $(LIB)/libmyutils.a
	rm -f obj/*.o bin/* lib/*.so
