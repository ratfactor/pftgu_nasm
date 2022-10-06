; Chapter 4 "Power Function"
; 
; Computes the value of 2^3 + 5^2, exits with value.
; Demonstrates how functions work.
;
;    $ ./go.sh ch03.2_maximum
;    Exited with code: 222
;

section .data

section .text

; Start - Call power twice, return result
; ---------------------------------------------------------
global _start
_start:
    push dword 3     ; second arg, push immediate value onto stack
    push dword 2     ; first arg, pushed last!
    call power

    add esp, 8       ; move stack pointer back to "erase" args
    push eax         ; save current answer on stack

    push dword 2     ; second arg
    push dword 5     ; first arg
    call power

    add esp, 8       ; move stack pointer back to "erase" args
    pop ebx          ; put previous saved answer into ebx
    add ebx, eax     ; add current answer to previous

    ; exit! ebx contains answer and is "returned" as exit code
    mov eax, 1
    int 0x80

; power function
; ---------------------------------------------------------
; input:
;   arg1 -> ebx   is the base number
;   arg2 -> ecx   is the exponent to raise base by
; output:
;   answer in eax
;
; Note: We're not testing this function externally yet,
;       but I *think* I have properly translated this
;       global function directive (elf specific?) to NASM:
global power:function
power:
    ; We move the stack pointer FORWARD to make room for 4 bytes
    ; of space for a "local variable" in traditional C function
    ; style. We point the base pointer register, ebp, to the
    ; the current stack position so we can use it to reference
    ; relative parts of the stack for "private use" in our
    ; function. Again, this is just a style or convention.
    push ebp       ; save previous base pointer
    mov ebp, esp   ; set it to stack pointer
    sub esp, 4     ; move pointer FORWARD to make room

    mov ebx, [ebp + 8]  ; first arg - base number
    mov ecx, [ebp + 12] ; second arg - exponent
    mov [ebp - 4], ebx  ; store base number as start of total

power_loop_start:
    cmp ecx, 1          ; once power is 1, we're done!
    je end_power
    mov eax, [ebp - 4]  ; put total in eax
    imul eax, ebx       ; multiply total by base
    mov [ebp - 4], eax  ; store total
    dec ecx             ; reduce power by 1
    jmp power_loop_start

end_power:
    mov eax, [ebp - 4]  ; put total in eax to return
    mov esp, ebp        ; restore stack pointer
    pop ebp             ; restore base pointer (we pushed it)
    ret
