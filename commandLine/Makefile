CFLAGS= -f elf

all: custom

custom: custom.o
	ld -m elf_i386 custom.o -o custom
custom.o:
	nasm $(CFLAGS) custom.asm -o custom.o
clean:
	rm -f *.o custom
