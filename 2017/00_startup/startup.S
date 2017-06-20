.align 4
.global _start
_start:
    @ disable interrupts
    cpsid aif
    @ set stack pointer base address
    ldr sp, =0x1c000000
    @ clear BSS
    @ r1: BSS start address
    @ r2: BSS end address
    @ r3: 0
    ldr r1, =__bss_start
    ldr r2, =__bss_end
    cmp r1, r2
    beq clear_bss_done
    movs r3, #0
clear_bss:
    @ write 0 to memory
    str r3, [r1]   @ [r1] = r3
    @ r1 = r1 + 4
    add r1, r1, #4
    @ jump to clear_bss if r1 == r2(__bss_end)
    cmp r1, r2
    bne clear_bss
clear_bss_done:
    @ goto main function
    bl main
    @ finish loop
    b .