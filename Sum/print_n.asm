global _start
section .text

print:
    push ebp
    mov ebp, esp
    sub esp,4 
    mov ebx, [esp-4]
    mov ebx, 1
    mov eax, 4
    int 80h
    pop ebp
    ret
_start:
    call print
