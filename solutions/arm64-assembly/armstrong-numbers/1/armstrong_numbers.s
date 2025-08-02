.text
.globl is_armstrong_number

is_armstrong_number:
        stp x29, x30, [sp, #-16]!
        mov x29, sp
        cmp x0, #9      // все цифры - числа Армстронга
        ble true

        mov x1, x0        
        mov x4, #10
        mov x2, #0   // counter of digits
        bl digit_count
        cmp x2, #2
        beq false        
         
        mov x1, x0   // save the value of x0
        mov x3, #0   // accumulate powering digits (x0 == x3)
        bl power_digit
        
        cmp x3, x0
        beq true
        b false
                
digit_count:
        add x2, x2, 1   // inc counter
        udiv x1, x1, x4
        cbnz x1, digit_count 
        ret

power_digit:
        cbz x1, return
        mov x7, x1      // save the value of x1
        udiv x1, x1, x4 // x1 = x1 / 10
        msub x5, x1, x4, x7 // x5 = x7 - x1 * x4  x5 - last digit of x1
        mov x6, x2          // save the value of x2
        mov x7, #1

pow_loop:
        cmp x5, #0
        beq power_digit 
        mul x7, x7, x5
        sub x6, x6, 1
        cmp x6, #0
        bne pow_loop
        add x3, x3, x7 
        b power_digit        

return: ret

true:
        mov x0, #1
        b end
false:
        mov x0, #0

end:    
        mov sp, x29
        ldp x29, x30, [sp], #16
        ret

