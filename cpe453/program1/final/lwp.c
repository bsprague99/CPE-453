#include <stdlib.h>
#include <stdio.h>
#include "lwp.h"

ptr_int_t * Original_stackPointer = NULL;
lwp_context lwp_ptable[LWP_PROC_LIMIT];
schedfun schedule = NULL;

ptr_int_t pid = 1;
int lwp = 0;
int lwp_procs = 0;

int new_lwp(lwpfun, void * , size_t);
void lwp_exit();
int lwp_getpid();
void lwp_yield();
void lwp_start();
void lwp_stop();
void lwp_set_scheduler(schedfun sched);

int new_lwp(lwpfun
    function, void * arg, size_t stacksize) {
    ptr_int_t * bp = NULL;

    if (lwp_procs > LWP_PROC_LIMIT) {
        return -1;
    }

    lwp = lwp_procs;
    ++lwp_procs;

    lwp_ptable[lwp].pid = pid++;
    lwp_ptable[lwp].stack = malloc(sizeof(ptr_int_t) * stacksize);
    lwp_ptable[lwp].stacksize = stacksize;
    ptr_int_t * sp = lwp_ptable[lwp].stack + stacksize;

    push(sp, 0x11111111);
    push(sp, lwp_exit);
    push(sp, function);
    push(sp, 0x11111111);
    // save location using bp
    bp = sp;

    // 15 registers
    push(sp, 0x11111111);
    push(sp, 0x11111111);
    push(sp, 0x11111111);
    push(sp, 0x11111111);
    push(sp, 0x11111111);
    push(sp, arg); // 10th from bottom up: rdi
    push(sp, 0x11111111);
    push(sp, 0x11111111);
    push(sp, 0x11111111);
    push(sp, 0x11111111);
    push(sp, 0x11111111);
    push(sp, 0x11111111);
    push(sp, 0x11111111);
    push(sp, 0x11111111);
    push(sp, 0x11111111);

    // return to location of bp so that it thinks its returning into lwp
    * sp = (ptr_int_t) bp;

    lwp_ptable[lwp].sp = sp;

    return lwp;
}

void lwp_exit() {
    free(lwp_ptable[lwp].stack);
    int i = lwp;
    while (i < lwp_procs - 1) {
        lwp_ptable[i] = lwp_ptable[i + 1];
        i++;
    }
    lwp_procs--;
    if (lwp_procs == 0) {
        lwp_stop();
    } else {
        lwp = schedule ? schedule() : 0;
        SetSP(lwp_ptable[lwp].sp);
        RESTORE_STATE();
    }
}

int lwp_getpid() {
    return lwp_ptable[lwp].pid;
}

void lwp_yield() {
    SAVE_STATE();
    GetSP(lwp_ptable[lwp].sp);
    if (schedule == NULL) {
        lwp = (lwp + 1) % lwp_procs;
    } else {
        lwp = schedule();
    }
    SetSP(lwp_ptable[lwp].sp);
    RESTORE_STATE();
}

void lwp_start() {
    if (lwp_procs == 0) {
        return;
    }
    SAVE_STATE();
    GetSP(Original_stackPointer);
    int next_running;
    if (!schedule) {
        next_running = 0;
    } else {
        next_running = schedule();
    }
    lwp = next_running;
    SetSP(lwp_ptable[lwp].sp);
    RESTORE_STATE();
}

void lwp_stop() {
    SAVE_STATE();
    SetSP(Original_stackPointer);
    RESTORE_STATE();
}

void lwp_set_scheduler(schedfun sched) {
    schedule = sched;
}