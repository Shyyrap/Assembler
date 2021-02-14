all:sum ld
sum:sum.o
sum.o:sum.asm
	nasm -f elf sum.asm
ld:sum.o
	ld -m elf_i386 sum.o -o sum
clean:
	rm -r *.o sum
