
global _start
section .data
msg db "Hello assembler world",10 
msg_len equ $-msg

section .text

_start:
        mov eax, 4      ;вызов write
        mov ebx, 1      ;стандартный вывод
        mov ecx, msg
        mov edx, msg_len
        int 80h

        mov eax, 1      ;вызов exit
        mov ebx, 0      ;код "Успех"
