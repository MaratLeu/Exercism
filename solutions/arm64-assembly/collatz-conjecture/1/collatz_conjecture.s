.equ INVALID_NUMBER, -1

.text
.globl steps

steps:
    MOV X1, X0                  // аргумент функции в x0
    MOV X0, INVALID_NUMBER      // счётчик
    CMP X1, #0
    BLE end
    ADD X0, X0, #1
main:
    CMP X1, #1
    BEQ end
    AND X2, X1, #1  // mask (последний бит)
    CBZ X2, even    // если четное
    // если нечетное
    MOV X2, X1      // сохраняем значение в x2
    LSL X2, X1, #1  // сначала умножаем на 2
    ADD X1, X2, X1  // умножили на 3
    ADD X1, X1, #1  // 3x + 1    
    ADD X0, X0, #1    
even:
    LSR X1, X1, #1  // делим на 2
    ADD X0, X0, #1 
    B main    

end:	
    ret
