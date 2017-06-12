CROSS= arm-none-eabi-

CC= $(CROSS)gcc
LD= $(CROSS)ld
OBJCOPY= $(CROSS)objcopy

OBJS=start.o main.o

CFLAGS = -mfloat-abi=soft -mlittle-endian -fno-builtin -nostartfiles -std=c11
LDFLAGS = -static -nostdlib

.SUFFIXES: .elf .bin

all: myprog.bin

myprog.elf:	$(OBJS)
	$(LD) $(LDFLAGS) -T ldscript.lds $^ `$(CC) -print-libgcc-file-name` -o $@

.elf.bin:
	$(OBJCOPY) -O binary $< $@
.c.o:
	$(CC) $(CFLAGS) -c $< -o $@
.S.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) *.o *.bin *.elf



   