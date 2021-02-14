global putstr
extern strlen

section .text
;procedire putstr
;[ebp+8] = address of the string

putstr:
    push ebp
    mov ebp, esp
    push dword[ebp+8]           ;вызываем strlen
    call strlen                 ;подсчет длины строки
    add esp, 4                  ;результат в eax
    kernel 4, 1, [ebp+8]        ;eax ; вызываем write
    mov esp, ebp                ;стандартное завершение
    pop ebp
    ret

