all: draw clean

draw.bin: draw.asm
	nasm -f bin -o draw.bin draw.asm

draw: draw.bin
	qemu-system-x86_64 -fda draw.bin

.PHONY: clean
clean:
	rm -f *.bin
