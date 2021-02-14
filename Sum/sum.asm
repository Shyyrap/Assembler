section .text
    global _start 
sum:
    push ebp
    mov ebp, esp
    mov ecx, [ebp+8]
    add ecx, [ebp+12]
    mov ebx, 1          ;file descriptor 
    mov eax, 4          ;system call number(sys_write)
    int 80h
    pop ebp
    ret
_start:
    xor edx, edx
    xor ebx, ebx
    mov edx, 12
    mov ebx, 11
    push ebx  
    push edx
    call sum
    add esp, 8
    mov eax, 1          ;system call (sys_exit)
    int 80h
