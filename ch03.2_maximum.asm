; Chapter 3 "Maximum"
; 
; Finds the largest value in a series of 4-byte values.
; Demonstrates x86 memory access via: address + index * multiplier.
;
;    $ ./go.sh ch03.2_maximum
;    Exited with code: 222
;
; Note: My version here differs from the book's. I don't preload
;       the first value into eax and I check for the sentinel
;       later in the loop. Savings: 1 instruction. :-)

section .data

; "double" sized items (32 bits) with zero sentinel at the end
data_items: dd 3, 67, 34, 222, 45, 75, 54, 0

section .text

global _start

_start:
    mov edi, 0 ; start our data "index" at 0
    mov ebx, 0 ; ebx will hold the largest value found

start_loop:
    mov eax, [data_items + edi * 4] ; get item by index (* 4 bytes)
    cmp eax, 0       ; have we hit the sentinel?
    je loop_exit     ; ...yes, we're done with the list
    inc edi          ; move index to next value to be checked.
    cmp eax, ebx     ; Is this value bigger?
    jle start_loop   ; ...no. Try the next value.
    mov ebx, eax     ; ...yes. Store it...
    jmp start_loop   ; ...and check next value

loop_exit:     ; ebx contains largest value, so that's our exit status
    mov eax, 1 ; linux syscall 'exit'
    int 0x80   ; interrupt to call linux kernel
