## 🔹 Feature-2: Multi-file Project using Make Utility

**Q1: What does the linking rule $(TARGET): $(OBJECTS) mean? How is it different from linking with a library?**

* It means: “To make the program (target), you first need all the object files.”
* Here, the program is made by joining (linking) .o files.
* If we used a library, we would not give .o files directly. Instead, we would say -lmyutils to use a ready-made .a or .so file.

*Q2: What is a git tag? Difference between simple and annotated tags?*

* A tag is like a *bookmark* for a specific commit.
* Simple tag → just a name for a commit.
* Annotated tag → has name, author, date, and a message (better for versions).

*Q3: Why do we make a GitHub Release? Why attach binaries?*

* A release is an official version of the project.
* Attaching binaries (like client) means anyone can use the program without compiling.

---

## 🔹 Feature-3: Static Library Build

*Q1: What is a static library? How is it made?*

* A static library (.a) is a file that collects object files.
* We make it with ar rcs libname.a file1.o file2.o.
* When we build the program, the code from this library is copied into the executable.

*Q2: Advantages and disadvantages?*

* ✅ Program runs faster (everything inside).
* ✅ No need for external files after build.
* ❌ Executable becomes large.
* ❌ If library changes, we must recompile the program.

---

## 🔹 Feature-4: Dynamic Library Build

*Q1: What is a dynamic library? Difference from static?*

* A dynamic library (.so) is linked at *runtime* (when the program runs).
* Static library makes the program bigger, but dynamic keeps it small and allows updates.

*Q2: How do we create one?*

* Compile with -fPIC (position independent).
* Link with -shared, e.g.:

  bash
  gcc -fPIC -c file.c -o file.o
  gcc -shared -o libname.so file1.o file2.o
  

*Q3: Advantages and disadvantages?*

* ✅ Smaller programs.
* ✅ Easy to update library without recompiling.
* ❌ Program needs the .so file to run.
* ❌ Version problems may happen if library changes too much.

---

## 🔹 Feature-5: Man Pages and Installation

*Q1: Why do we need man pages?*

* They are built-in help pages you can open with man.
* They explain how to use the program and its functions.

*Q2: How to install executable and man pages?*

* Copy program to /usr/local/bin/ so it runs from anywhere.
* Copy man pages to /usr/local/share/man/.
* Run mandb to refresh.

*Q3: Why install?*

* Makes program available for all users.
* Man pages make it professional and user-friendly.
