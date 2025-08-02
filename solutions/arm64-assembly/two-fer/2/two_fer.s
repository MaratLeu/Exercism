.data
prefix: .string "One for "
person: .string "you"
postfix: .string ", one for me."

.text
.globl two_fer

two_fer:
    stp x29, x30, [sp, #-16]!  // сохранить FP и LR
    mov x29, sp

    adr x2, prefix             // копируем префикс
    bl  copy_string
    sub x0, x0, #1

    cmp x1, #0
    adr x2, person             // дефолтное имя
    csel x2, x1, x2, ne        // если в x1 не NULL - используем х1; иначе person
    bl  copy_string
    sub x0, x0, #1

    adr x2, postfix            // копируем постфикс
    bl  copy_string

    mov sp, x29                // восстановить sp
    ldp x29, x30, [sp], #16    // восстановить FP и LR
    ret

copy_string:
    ldrb w3, [x2], #1
    strb w3, [x0], #1
    cmp w3, #0
    bne copy_string
    ret

