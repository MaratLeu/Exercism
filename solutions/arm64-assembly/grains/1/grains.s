.text
.globl square
.globl total

square:
        cmp x0, #0
        ble invalid
        cmp x0, #64
        bgt invalid
        mov x1, x0
        sub x1, x1, #1
        mov x0, #1
        lsl x0, x0, x1
        b end
invalid:    
        mov x0, #0

end:    ret

total:
        // geometric progression S = b1 (q^n - 1) / (q - 1), b1 - the first term, q - ratio
        // b1 = 1, q = 2, S = 2 ^ n - 1
        stp x29, x30, [sp, #-16]!
        
        mov x0, #0
        mov x3, #0  // sum

loop:   add x0, x0, #1
        mov x19, x0  // save the previous value of x0
        bl square
        add x3, x3, x0
        mov x0, x19  // return the value of x0
        cmp x0, #64
        bne loop         
        
        mov x0, x3
        ldp x29, x30, [sp], #16
        ret
