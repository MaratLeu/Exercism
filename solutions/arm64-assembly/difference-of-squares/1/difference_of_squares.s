.text
.globl square_of_sum
.globl sum_of_squares
.globl difference_of_squares

// x1 - square of sum
// x2 - sum of squares

square_of_sum:
        // (1 + 2 + 3 + 4 + 5) ^ 2 = ((1 + 5) * 5  / 2) ^ 2 = ((x1 + x2) * x2) >> 1) ^ 2
        mov x2, x0
        mov x1, #1
        add x1, x1, x2 
        mul x1, x1, x2
        lsr x1, x1, #1
        mul x1, x1, x1   
       
        mov x0, x1
        ret
sum_of_squares:
        // 1^2 + 2^2 + 3^2 + 4^2 + 5^2
        mov x3, #1
        mov x2, #0
loop:   cmp x3, x0
        bgt end
        madd x2, x3, x3, x2  // x2 = x3 * x3 + x2
        add x3, x3, #1
        b loop

end:    mov x0, x2
        ret
       
difference_of_squares:
        stp x29, x30, [sp, #-16]!
        mov x4, x0
        bl square_of_sum
        mov x1, x0
        mov x0, x4
        bl sum_of_squares
        mov x2, x0
        sub x0, x1, x2
        ldp x29, x30, [sp], #16
        ret
