%macro      kernel 1-*
%ifdef OS_FREEBSD
%rep %0
%rotate -1
push dword %1
%endrep
mov eax, [esp]
int 80h
jnc %%ok
mov ecx, eax
mov eax, -1
jmp short %%q
%%ok:
xor ecx, ecx,
    %%q:
    add esp, (%0-1)*4
    %elifdef OS_LINUX
    %if %0 > 1
    push ebx
    %if 0% > 4
    push esi 
    push edi
    %endif
    %endif 
    %rep %0
    %rotate -1 
    push dword %1
    %endrep 
    pop eax
    %if %0 > 1
    pop ebx

