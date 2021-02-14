CFLAGS= -f elf32
LFLAGS= -m elf_i386

all: hello

hello: hello.o
	ld -m elf_i386 hello.o -o hello
.o: hello.asm
	nasm $(CFLAGS) hello.asm -o hello.o

clean:
	rm -f *.o hello 
