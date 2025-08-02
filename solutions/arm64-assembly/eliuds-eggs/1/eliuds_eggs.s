.text
.globl egg_count

egg_count:
        mov x1, x0
        mov x2, #1
        mov x0, #0 // counter of bits 1
        mov x4, #64
loop:
        and x3, x1, x2
        cbz x3, bit0
        add x0, x0, #1

bit0:
        lsr x1, x1, #1
        sub x4, x4, #1
        cbz x4, end
        b loop

end:
        ret
