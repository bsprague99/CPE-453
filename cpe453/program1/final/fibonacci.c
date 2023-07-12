#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>
#include "lwp.h"

#define INITIALSTACK 256

typedef void (*sigfun)(int signum);
static void fibonacci(void *num);


int main(int argc, char *argv[]){
  ptr_int_t i; 

  printf("Launching LWPS\n");

  /* spawn a number of individual LWPs */
  for(i=1;i<=4;i++) {
    new_lwp(fibonacci,(void*)i, INITIALSTACK);
  }

  lwp_start();                     /* returns when the last lwp exits */

  printf("Back from LWPS.\n");
  return 0;
}

static void fibonacci(void *i) {
  /* print the fibonacci sequence */
    ptr_int_t first = 0, second = 1, next;
    ptr_int_t procNum;
    procNum=(ptr_int_t)i;  

  while (second < 1000) {
    next = first + second;
    first = second;
    second = next;    

    if (next > 100 * procNum)
    {
      lwp_exit();
    }
    printf("%*"PTR_INT_T_FMT"\n",(int)procNum*5,next);
    
    /* let another have a turn */
    lwp_yield();                
  }

 /*   bail when done. This should
  *   be unnecessary if the stack has
  *   been properly prepared
  */
  lwp_exit();                   
}

