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
	mov R7, #0x04 # write command (Refer the sys call table)
	mov R0, #0x01
	ldr R1, =message
	mov R2, #0x0D
	swi 0

	mov R7, #0x01 # exit command (Refer the sys call table)
	mov R0, #0x41
	swi 0

.section .data
	message:
	.ascii "Hello World\n"
