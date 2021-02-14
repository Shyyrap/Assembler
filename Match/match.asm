global _start
section .text
    pattern db "*ring"
    string db "This is string"
match:
    push ebp
    mov ebp, esp
    sub esp, 4          ;локальная переменная I
                        ;будет по адресу [ebp-4]
    push esi            ;сохраняем регистры ESI EDI
                        ;EAX все равно изменится
    push edi
    mov esi, [ebp+8]    ;загружаем параметры:адрес
    mov edi, [ebp+12]   ;строки и образца 
.again:                 ;сюда вернемся, когда 
                        ;сопоставим очередной символ
                        ;и сдвинемся 
    cmp byte [edi], 0   ;образец кончился?   
    jne .not_end        ;если нет, прыгаем
    cmp byte [esi], 0   ;образец кончился, а строка?
    jne near .false     ;если нет, вернуть ложь
    jmp .true           ;кончились одновременно:ИСТИНА
.not_end:               ;если образец не кончился...
    cmp byte[edi], '*'  ;не звездочка ли в его начале
    jne .not_star       ;если нет, прыгаем отсюда
                        ;звездочка! организуем цикл
    mov dword[ebp-4], 0 ; I := 0
.start_loop:            
                        ;готовимся к рекурсии
    mov eax, edi        ;сначала второй аргументЖ
    inc eax             ;образец со след символа
    push eax
    mov eax, esi        ;теперь первый аргумент
    add eax, [ebp-4]    ;   строка c I-го символа
    push eax            ;[ebp-4] - I 
    call match          ;вызываем сами себя, но с
                        ;новыми параметрами
    add esp, 8          ;после вызова очищаем стек
    test eax, eax       ;что нам вернули?
    jnz .true           ;вернули не ноль,т.е ИСТИ

                        ;значит, остаток строки со
                        ;поставился с остатком
                        ;образца => вернем ИСТИНУ
    add eax, [ebp-4]    ;вернули 0, т.е ЛОЖЬ
                        ;надо попробовать больше 
                        ;символов "списать" на
                        ;эту звездочку
    cmp byte [esi+eax],0 ;но может быть ,строка
                        ;кончилась?
    je  .false           ;тогда пробовать больше 
    inc dword[ebp-4]    ;нечего иначе пробуем: 
                        ;I := I+1
    jmp .start_loop     ; и в начало цикла по I
.not_star:
    mov al, [edi]       ;не пуст и не нач с . *
    cmp al, '?'         ;м.б '?'
    je .quest           ;если да, прыгаем отсюда
    cmp al, [esi]       ;если нет, символы внача
    
                        ;ле строки и образца долж
                        ;ны совпадать. Если строк
                        ;a кончилась, эта проверк
                        ;a тоже не пройдет
    jne .false          ;не совпали
    jmp .goon           ;совпали - продолжаем
                        ;просмотр
.quest:                 ;образец кончился с '?'
    cmp byte [esi], 0   ;надо только, чтобы стр
                        ;ока не кончилась
    jz .false           ;иначе ЛОЖЬ     
.goon:  
    inc esi             ;символы сопоставились ->
    inc edi             ;сдвигаемся по строке
    jmp .again          ;и продолжаем
.true:
    mov eax, 1          ;вернуть истину
    jmp .quit
.false:
    xor eax, eax
.quit:
    pop edi
    pop esi
    mov esp, ebp
    pop ebp
    ret
_start:
    push dword pattern
    push dword string
    call match
    add esp, 8
