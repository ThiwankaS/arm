# Assembly first project - Hello World

# Get the enviornment ready

# Run -> sudo apt install gcc-arm-linux-gnueabi
# Run -> sudo apt install gcc-9-arm-linux-gnueabi
# Run -> sudo apt install qemu-user

# Running the code

# Step 01 -> arm-linux-gnueabi-as first.asm -o first.o
# Step 02 -> arm-linux-gnueabi-gcc-9 first.o -o first.elf -nostdlib
# Step 03 -> qemu-arm ./first.elf

# arm 32 sys call table link
# https://chromium.googlesource.com/chromiumos/docs/+/master/constants/syscalls.md#arm-32_bit_EABI

.global _start
.section .text

_start:
	MOV R7, #0x04
	MOV R0, #0x01
	LDR R1, =message
	MOV R2, #0x0D
	SWI 0

	MOV R7, #0x01
	MOV R0, #0x41
	SWI 0

.section .data
	message:
	.ascii "Hello World\n"
