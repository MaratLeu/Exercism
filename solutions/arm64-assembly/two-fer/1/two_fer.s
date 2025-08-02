.globl two_fer

.data
buffer: .space 100
string: .asciz "One for %s, one for me.\n"
unname: .asciz "you"

.extern sprintf

two_fer:
        MOV X1, X0
        CBZ X1, no_name
        LDRB W2, [X1]
        CBZ W2, no_name
        B main

no_name:
        ADR X1, unname        

main:
        MOV X2, X1
        ADR X0, buffer
        ADR X1, string

        MOV X8, #0
        bl sprintf
        
        ADR X0, buffer
        MOV X0, #0
end:
        ret

