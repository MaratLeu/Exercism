.text
.globl reverse

reverse: 
        MOV X1, X0
        
find_end:
        LDRB W2, [X1], #1  // 1 to increase the pointer  
        CMP W2, #0
        CBNZ W2, find_end
        SUB X1, X1, #2     // 2 cause the pointer is on the next after \0 (R1 now is on the lats significant character)
        
main:
        CMP X0, X1
        BGE end
        
        LDRB W2, [X0]      // загружаем байт в регистр W2
        LDRB W3, [X1]      // загружаем байт в регистр W3
        
        STRB W3, [X0]      // сохраняем значение из конца
        STRB W2, [X1]      // сохраняем значение из начала
 
        ADD X0, X0, #1     // увеличиваем указатель на 1
        SUB X1, X1, #1     // уменьшаем указатель на 1
        
        B main

end:
        ret
