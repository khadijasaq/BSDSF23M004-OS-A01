#include <stdio.h>
#include "../include/mystrfunctions.h"
#include "../include/myfilefunctions.h"

int main() {
    printf("--- Testing String Functions ---\n");
    char str1[100] = "Hello";
    char str2[100];

    printf("Length of '%s' = %d\n", str1, mystrlen(str1));
    mystrcpy(str2, str1);
    printf("Copied string: %s\n", str2);
    mystrcat(str1, " World");
    printf("Concatenated: %s\n", str1);

    printf("\n--- Testing File Functions ---\n");
    FILE* fp = fopen("test.txt", "r");
    if (fp) {
        int lines, words, chars;
        wordCount(fp, &lines, &words, &chars);
        printf("File stats: Lines=%d Words=%d Chars=%d\n", lines, words, chars);
        fclose(fp);
    } else {
        printf("test.txt not found. Create one to test wordCount/mygrep.\n");
    }

    return 0;
}
