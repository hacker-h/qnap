#include <unistd.h> 
#include <stdio.h>
#include <stdlib.h>
#include <crypt.h>

int main()
{
    printf("%s",crypt("DT0qUmN1TY6aBf98g72n","$1$YCCaQNAP$"));
    exit(0);
}
