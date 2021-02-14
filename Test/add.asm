global _start

section .text

addFunction:
    push ebp
    mov ebp, esp
    mov eax, [ebp+8]
    mov ecx, [ebp+12]
    add eax, ecx
    mov esp, ebp
    pop ebp
    ret
_start:
    xor ecx, ecx
    xor eax, eax
    mov ecx, 4
    mov eax, 12
    push ecx
    push eax
    call addFunction
