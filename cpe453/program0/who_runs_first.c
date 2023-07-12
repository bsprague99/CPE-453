#include <stdio.h>
#include <unistd.h>
#include <sys/wait.h>
#include <sys/types.h>
#include <unistd.h>


int main(void) 
{

    pid_t child_pid;
    char parent[] = "parent\n";
    char child[] = "child\n";
    int parent_length = sizeof(parent) - 1;
    int child_length = sizeof(child) - 1;

    for (int i = 0; i < 1000; i++) 
    { 
        if ((child_pid = fork()) == 0) 
        {
            sleep(10);
            write(STDOUT_FILENO, child, child_length);
            return 0;
        } 
        else 
        {
            sleep(10);
            write(STDOUT_FILENO, parent, parent_length);
            waitpid(child_pid, NULL, 0);
        }
        printf("\n");
    }
    return 0;
} 