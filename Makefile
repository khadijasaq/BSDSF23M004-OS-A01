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
CC = gcc
CFLAGS = -I$(INCLUDE)

all: $(TARGET)

# Rule to build the static library
$(LIBRARY): $(OBJ)/mystrfunctions.o $(OBJ)/myfilefunctions.o
	ar rcs $(LIBRARY) $^

# Compile object files
$(OBJ)/%.o: $(SRC)/%.c
	$(CC) $(CFLAGS) -c $< -o $@

# Link main with library
$(TARGET): $(OBJ)/main.o $(LIBRARY)
	$(CC) $^ -o $@ -L$(LIB) -lmyutils

clean:
	rm -f $(OBJ)/*.o $(TARGET) $(LIB)/libmyutils.a

