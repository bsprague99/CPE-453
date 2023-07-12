#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>

int main(void)
{
int i = 0;
   while (fork() && i < 5)
    {
        wait(NULL);
        printf("Yo!");
        i++; 
    }
    printf("%d", i);
    return 0; 
} 
