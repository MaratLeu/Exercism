.data
simple_question: .asciz "Sure."
yell: .asciz "Whoa, chill out!"
yell_question: .asciz "Calm down, I know what I'm doing!"
silence: .asciz "Fine. Be that way!"
anything: .asciz "Whatever."


.text
.globl response

response:   
        stp x29, x30, [sp, #-16]!
        mov x29, sp
        ldrb w1, [x0]
        cmp w1, #' '
        beq whitespace
        
main:   
        ldrb w1, [x0], #1
        cbz w1, yelling
        cmp w1, #'a'
        bge not_yelling
        b main        

yelling:
        sub x0, x0, #2
        ldrb w1, [x0]
        cmp w1, #'?'
        beq yelling_question
        adr x0, yell
        b end        

not_yelling:
        ldrb w1, [x0], #1
        cbnz w1, not_yelling
        sub x0, x0, #2
        ldrb w1, [x0]
        cmp w1, #'?'
        beq question
        adr x0, anything
        b end

yelling_question:
        adr x0, yell_question
        b end

question:
        adr x0, simple_question
        b end

whitespace:
        adr x0, silence

end:
        ldp x29, x30, [sp], #16
        ret
