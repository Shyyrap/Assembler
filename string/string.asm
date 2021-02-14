section .text
start_
    xor ebx, ebx
    xor ecx, ecx
lp:
    mov bl, [esi+ecx];очередной байт из строки
    cmp bl, 0 ; не конец ли строки?
    je lpquit ;если да, то выходим из цикла
    push ebx  ;bl в составе ebx
    inc ecx
    jmp lp
lpquit:
    jecxz done ;если строка пустая - конец
    mov edi, esi ; опять с начала буфера
lp2:
    pop ebx
    mov [edi] , bl
    inc edi 
    loop lp2
done:
