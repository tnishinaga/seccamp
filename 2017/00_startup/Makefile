# configure
CROSS = arm-none-eabi-
TARGET=myprog

# toolchain
CC = $(CROSS)gcc
CPP = $(CROSS)g++
AS = $(CROSS)as
LD = $(CROSS)ld
STRIP = $(CROSS)strip
READELF = $(CROSS)readelf
OBJDUMP = $(CROSS)objdump
OBJCOPY = $(CROSS)objcopy

# objects
STARTUP=startup.o
OBJS=main.o
LDSCRIPT=ldscript.lds

# libgcc
LIBGCC=$(shell $(CC) -print-libgcc-file-name)

# FLAGS
CFLAGS=-mfloat-abi=soft -mlittle-endian -fno-builtin -nostartfiles -std=c11
CFLAGS+=-I.
LDFLAGS = -static -nostdlib

.SUFFIXES: .elf .bin

all: $(TARGET).bin

$(TARGET).elf: $(LDSCRIPT) $(LIBS) $(STARTUP) $(OBJS)
	$(LD) $(LDFLAGS) -T $^ $(LIBGCC) -o $@ 

.elf.bin:
	$(OBJCOPY) -O binary $< $@
.c.o:
	$(CC) $(CFLAGS) -c $< -o $@
.S.o:
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	$(RM) -f *.o *.img *.elf */*.o */*/*.o *.d */*.d
	