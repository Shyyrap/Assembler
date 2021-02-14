section .text
    global _start
section .data
    some db 'Hello world'
string_length:
    push ebp
    mov ebp, esp
    xor eax, eax
    mov ecx, [ebp+8]
.lp:
    cmp byte[ecx+eax], 0
    jz .quit
    inc eax
    jmp short .lp
.quit:
    pop ebp
    ret
print_value:
    push ebp
    mov ebp, esp
    mov eax, 4
    mov ebx, 1
    mov ecx, [ebp+8]
    mov edx, 1
    int 80h
    pop ebp
    ret
_start:
   xor esi,esi 
   mov esi, 4 
   push esi 
   call print_value
   mov eax, 1
   int 80h
