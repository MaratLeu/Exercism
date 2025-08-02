.text
.globl leap_year

leap_year:
        MOV X1, X0
        
main:   AND X2, X1, #3  // check 2 last bits (mod % 4)
        CBNZ X2, not_leap // 1975 not leap
        
        MOV X2, #100
        UDIV X3, X1, X2    // X3 = X1 // 100
        MUL X4, X3, X2     // X4 = X3 * 100
        SUB X2, X1, X4     // X2 = X1 - X4 (mod % 100)
        
        CBNZ X2, leap      // 1976 leap
        AND X4, X3, #3     // mod % 400        
        CBZ X4, leap
not_leap: 
        MOV X0, #0
        B end        

leap:   MOV X0, #1

end:    ret
