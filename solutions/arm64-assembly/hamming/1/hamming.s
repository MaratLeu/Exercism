.equ UNEQUAL_LENGTHS, -1

.text
.globl distance


distance:
        mov x5, #0
loop:
        ldrb w3, [x0], #1
        ldrb w4, [x1], #1
        cmp w3, #0
        beq end_of_1_str
        cmp w4, #0
        beq end_of_2_str
        cmp w3, w4
        beq equal_bit
        add x5, x5, #1

equal_bit:
        b loop

end_of_1_str:
        cmp w4, #0
        bne unequal_lengths
        mov x0, x5
        b end
end_of_2_str:
        cmp w3, #0
        bne unequal_lengths
        mov x0, x5
        b end

unequal_lengths:
        mov x0, UNEQUAL_LENGTHS
end:
        ret
