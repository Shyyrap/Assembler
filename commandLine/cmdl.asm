;;cmdl.asm;;
global _start
section .text

nlstr   db  10, 0

strlen:
    push ebp
    mov ebp, esp
    xor eax, eax
    mov ecx, [ebp+8]
.lp:
    cmp byte [eax+ecx], 0
    jz .quit
    inc eax
    jmp short .lp
.quit:
    pop ebp
    ret

print_str:
    push ebp
    mov ebp, esp
    push ebx
    mov ebx, [ebp+8]
    push ebx
    call strlen
    add esp, 4          ;the length is now in eax

%ifdef OS_LINUX
    mov edx, eax        ;edx contains length
    mov ecx, ebx        ;arg1 was stored in ebx
    mov ebx, 1          ;stdout
    mov eax, 4          ;write
    int 80h
%endif
    pop ebx
    mov esp, ebp
    pop ebp
    ret

_start:
    mov ebx, [esp]      ;argc
    mov esi, esp
    add esi, 4          ;argv
again:
    push dword [esi]    ;argv[i]
    call print_str
    add esp, 4
    push dword nlstr
    call print_str
    add esp,4
    add esi, 4
    dec ebx
    jnz again
    mov ebx, 1
    mov eax, 4
    int 80h
