%macro pcall1 2                 ;2 --кол-во пар-ов макроса
        push %2
        call %1
        add esp, 4
%endmacro

%macro pcall2 3
        push %3
        push %2
        call %1
        add esp, 8
%endmacro

%macro pcall3 4
        push %4
        push %3
        push %2
        call %1
        add esp, 12
%endmacro

%macro pcall0 1
        call %1
%endmacro

%define arg1 ebp+8
%define arg2 ebp+12
%define arg3 ebp+16
%define local1 ebp-4
%define local2 ebp-8
%define local3 ebp-12

