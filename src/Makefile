# Compiler and flags
CC = gcc
CFLAGS = -I../include -Wall
OBJDIR = ../obj
BINDIR = ../bin

# Source and object files
SRC = mystrfunctions.c myfilefunctions.c main.c
OBJ = $(SRC:%.c=$(OBJDIR)/%.o)
TARGET = $(BINDIR)/client

# Default target
all: $(TARGET)

# Linking rule
$(TARGET): $(OBJ)
	$(CC) $(OBJ) -o $@

# Compilation rule
$(OBJDIR)/%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Utility target
clean:
	rm -f $(OBJDIR)/*.o $(TARGET)
