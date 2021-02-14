section .text
    global _start

_start:
    mov esi, [esp+4]
    mov eax, 4
    mov ebx,1 
    mov edx,7 
    mov ecx, esi
    int 80h

    mov eax, 1
    int 80h

