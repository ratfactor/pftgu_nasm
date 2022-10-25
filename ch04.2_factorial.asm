; Chapter 4 Factorial (recursive)
; 
; Computes the factorial
; Demonstrates recursive functions and the stack.
;
;     $ ./go.sh ch04.2_factorial
;     Exited with code: 24
;
section .data

section .text

; Start - Call power twice, return result
; ---------------------------------------------------------
global _start
_start:
    push dword 4     ; push function arg on stack

    call factorial   ; call recursive function!

    ; Move the stack pointer BACKWARD (by adding) to remove
    ; the parameter that was pushed onto the stack. 
    add esp, 4

    ; Move the answer in eax to ebx to use as exit code.
    mov ebx, eax
    mov eax, 1       ; syscall 'exit'
    int 0x80         ; linux interrupt

; factorial function
; ---------------------------------------------------------
; input:
;   arg1 -> eax   is the base number
; output:
;   answer in eax
;
; Note: This function calls itself recursively!
global factorial:function
factorial:
    push ebp       ; save base pointer
    mov ebp, esp   ; set it to stack pointer

    ; Get first param into eax
    ;   ebp + 4 is the return address
    ;   ebp + 8 is the first param
    mov eax, [ebp + 8]

    ; If the param is 1, that's our base case, return it!
    cmp eax, 1
    je .end_factorial

    ; Keep going: decrement the value and recurse!
    dec eax
    push eax ; push param
    call factorial

    ; Recursion done, stack is now full of values to be
    ; multiplied. Register eax contains the previous result.
    mov ebx, [ebp + 8]
    imul eax, ebx

.end_factorial:
    ; Restore stack stuff and return. Answer already in eax.
    mov esp, ebp
    pop ebp
    ret
