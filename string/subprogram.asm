section .text
subprog:
    push ebp
    mov ebp esp
    sub 4 edi
    mov eax 2
    mov edi[eax]
    mov esp ebp
    pop ebp
    ret
start_
    push ebp
    mov ebp esp
    call subprog
