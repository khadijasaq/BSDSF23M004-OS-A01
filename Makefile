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

# Clean build artifacts
clean:
	rm -f $(OBJ)/*.o $(TARGET)

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
