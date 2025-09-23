Perfect 👌 Here’s a *README.md* written in *easy but professional style* that you can put in your repo. It explains everything you did in the assignment.

---

# 📘 Operating Systems Assignment – Multi-File Project with Make & Libraries

## 📌 Overview

This project was done as part of my Operating Systems course.
The main purpose was to *learn project organization, compilation with Makefiles, static and dynamic libraries, Git workflow, and documentation with man pages*.

---

## 📂 Project Structure


ROLL_NO-OS-A01/
│── src/        # Source code (.c files)
│── include/    # Header files (.h files)
│── obj/        # Object files (.o files)
│── lib/        # Static and dynamic libraries
│── bin/        # Final executables
│── man/        # Man pages
│── REPORT.md   # Answers to assignment questions
│── Makefile    # Main build file


---

## ⚙ Features Implemented

### 🔹 Feature-1: Project Setup & Git

* Created GitHub repo and cloned locally.
* Made proper folder structure.
* Pushed initial commit to main branch.

### 🔹 Feature-2: Multi-file Compilation

* Wrote code across multiple .c and .h files.
* Created a *Makefile* to compile them into one executable.
* Used multifile-build branch.
* Created a *tag* (v0.1.1-multifile) and first GitHub release.

### 🔹 Feature-3: Static Library Build

* Made a static library libmyutils.a.
* Linked it with main program.
* Learned difference between linking .o files directly vs using a .a library.

### 🔹 Feature-4: Dynamic Library Build

* Built a shared library libmyutils.so.
* Linked dynamically at runtime.
* Learned about -fPIC and -shared options in gcc.

### 🔹 Feature-5: Man Pages & Installation

* Wrote man pages for functions.
* Created install target in Makefile to:

  * Copy client into /usr/local/bin/.
  * Copy man pages into /usr/local/share/man/man3/.
  * Update database using mandb.
* Now client runs globally and man myfunction shows documentation.

---

## 🛠 Build Instructions

### 🔹 Compile the project

bash
make


### 🔹 Run the executable

bash
./bin/client


### 🔹 Clean build files

bash
make clean


### 🔹 Install program + man pages (requires sudo)

bash
sudo make install


---

## 🔖 Git Workflow

* main → Final stable branch.
* multifile-build → Multi-file compilation feature.
* static-build → Static library build.
* dynamic-build → Dynamic library build.
* man-pages → Man page and installation feature.
* Tags:

  * v0.1.1-multifile → Multi-file build.
  * Other tags created for static/dynamic/man features.

---

## 📄 Report

All theoretical questions are answered in *REPORT.md*.

* Difference between static and dynamic libraries.
* Linking rules in Makefile.
* Purpose of git tags and GitHub releases.
* Why man pages are important.

---

## 👤 Author

* *Name:* Khadija Shahzad
* *Roll No:* BSDSF23M004
* *Course:* Operating Systems – Assignment 01

---

Would you like me to also add a *diagram* (workflow: source → object → library → executable → install) inside the README to impress your teacher?
