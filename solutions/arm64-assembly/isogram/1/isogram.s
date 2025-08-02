.text
.globl is_isogram

is_isogram:
        mov x2, #-1
len:
        add x2, x2, #1  // x2 stores the len of the string
        ldrb w1, [x0, x2]
        cbnz x1, len
        cbz x2, isogram
        cmp x2, #1
        beq isogram
create_room:
        add x2, x2, #15
        bic x2, x2, #15
        sub sp, sp, x2  // allocate memmory in stack
        mov x3, sp      // x3 points to the array
        mov x4, #0
fill_array:
        ldrb w1, [x0], #1
        cbz x1, prepare_to_sort
        strb w1, [x3, x4]
        add x4, x4, #1
        b fill_array

prepare_to_sort:
        mov x5, x4
        sub x4, x4, #1
        add x3, x3, x4
        /* x3 points to the last significant symbol
           i'll try to this algroithm for example
           s <- e <- v <- e <- n
            <- e <- v <- e not isogram
        */
algorithm:
        ldrb w1, [x3]

compare:
        sub x5, x5, #1
        cbz x5, end_of_loop
        sub x3, x3, #1
        ldrb w6, [x3]
        cmp w1, w6
        bne check_lower_upper

check_whitespace:
        cmp w1, #32  // whitespace
        beq compare
check_hyphen:
        cmp w1, #45  // hyphen
        bne not_isogram
        b compare

check_lower_upper:
        sub w7, w1, w6
        cmp w7, #0
        csneg w7, w7, w7, pl
        cmp w7, #32
        beq not_isogram
        b compare

end_of_loop:
        mov x5, x4
        sub x4, x4, #1
        cbz x4, isogram
        add x3, x3, x4
        b algorithm

isogram:
        mov x0, #1
        b end

not_isogram:
        mov x0, #0
end:
        add sp, sp, x2
        ret

