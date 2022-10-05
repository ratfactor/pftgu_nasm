; Chapter 3 "exit"
;
; Uses Linux syscall "exit" with return value in ebx.
; Example run:
;
;   $ ./go.sh ch03.1_exit  # script in this repo
;   Exited with code: 0
;
; Or with 42 in  ebx:
;
;   $ ./go.sh ch03.1_exit
;   Exited with code: 42

section .data

section .text

global _start
_start:
    mov eax, 1 ; linux syscall 'exit'
    mov ebx, 0 ; return value for exit
    int 0x80   ; interrupt to call linux kernel
