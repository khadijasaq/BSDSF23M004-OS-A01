# ===========================
# Feature-5 Makefile
# ===========================

# Directories
SRC = src
OBJ = obj
BIN = bin
INCLUDE = include
LIB = lib
MAN_DIR = man/man3

# Source files
SRCS = $(SRC)/mystrfunctions.c $(SRC)/myfilefunctions.c $(SRC)/main.c
OBJS = $(OBJ)/mystrfunctions.o $(OBJ)/myfilefunctions.o $(OBJ)/main.o

# Final executable
TARGET = $(BIN)/client

# Compiler
CC = gcc
CFLAGS = -I$(INCLUDE) -Wall -Wextra

# Default build target
all: $(TARGET)

# Compile object files
$(OBJ)/%.o: $(SRC)/%.c
        @mkdir -p $(OBJ)
        $(CC) $(CFLAGS) -c $< -o $@
# Link executable
$(TARGET): $(OBJS)
        @mkdir -p $(BIN)
        $(CC) $(OBJS) -o $(TARGET)
=======
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

obj/myfilefunctions.o: src/myfilefunctions.c
        $(CC) $(CFLAGS) -c $< -o $@
>>>>>>> dynamic-build

# Clean build artifacts
clean:
<<<<<<< HEAD
        rm -f $(OBJ)/*.o $(TARGET)
=======
        rm -f obj/*.o bin/* lib/*.so
>>>>>>> dynamic-build

# Install executable and man pages
install: $(TARGET)
        @echo "Installing executable..."
        sudo cp $(TARGET) /usr/local/bin/client
        @echo "Installing man pages..."
        sudo mkdir -p /usr/local/share/man/man3
        sudo cp $(MAN_DIR)/*.1 /usr/local/share/man/man3/
        sudo mandb
        @echo "Installation complete! You can run 'client' from anywhere and use 'man <function>'"

.PHONY: all clean install
