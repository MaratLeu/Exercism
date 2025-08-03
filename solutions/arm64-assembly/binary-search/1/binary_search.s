.text
.globl find

find:
        cbz w2, not_find  // null array

        cmp w2, #1        // array that consists of 1 element
        bne prepare
        mov w6, #0        // 0 index for array of 1 element 
1:
        lsl w3, w6, #1  // w3 = w6 * 2
        uxtw x3, w3
        ldrh w4, [x1, x3]
        cmp w0, w4
        bne not_find
        mov w0, w6
        b end

prepare:
        mov w7, #0      // left bound
        mov w9, w2      // right bound
bsearch:
        add w6, w7, w9  // responsible for index
        lsr w6, w6, #1  // middle index w6 = (w7 + w9) // 2

        cmp w2, #1
        beq 1b
        cbz w2, not_find
        lsr w2, w2, #1  // divide array in half
                
        // int_16t - 2 bytes
        lsl w3, w6, #1  // w3 = w6 * 2
        uxtw x3, w3     // expand w3
        ldrh w4, [x1, x3] // save the value of the middle element
        cmp w0, w4
        beq find_pos
        blt bsearch_left  // shift to left part of array 

        // shift to right part of array
bsearch_right:
        mov w7, w6
        add w7, w7, #1  // left = middle + 1
        b bsearch

bsearch_left:
        mov w9, w6      // right = middle - 1
        sub w9, w9, #1
        b bsearch

find_pos:
        mov w0, w2
        b end

not_find:
        mov x0, #-1

end:
        ret

