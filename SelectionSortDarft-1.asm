.model small
.data
    array db 5, 2, 9, 1, 5 ; Example array to be sorted
    n equ $ - array ; Number of elements in the array

    msg db "Sorted Array: $"

.code
    mov ax, @data
    mov ds, ax

    call selectionSort

    ; Display the sorted array
    mov ah, 09h       ; DOS function to print a string
    lea dx, msg       ; Load offset of the message into dx
    int 21h           ; Call DOS

    mov cx, n         ; Set the loop counter to the number of elements  
    mov bx,cx
    lea si, array     ; Load the offset of the array into si

printLoop:
    mov dl, [si]      ; Load the current element of the array into dl
    add dl, '0'       ; Convert the numeric value to ASCII
    mov ah, 02h       ; DOS function to print a character
    int 21h           ; Call DOS

    inc si            ; Move to the next element in the array
    loop printLoop    ; Repeat until all elements are printed

    ; Exit program
    mov ah, 4ch
    int 21h

selectionSort:
    mov cx, n
    mov bx,cx
    dec bx ; outer loop counter

outerLoop:
    mov di, 0 ; index of the minimum element

    ; Inner loop to find the minimum element in the unsorted part
    mov si, di
innerLoop:
    inc si
    cmp si, n
    jge innerLoopEnd

    mov al, array[si]
    cmp al, array[di]
    jge innerLoopEnd

    mov di, si ; Update the index of the minimum element

    jmp innerLoop

innerLoopEnd:
    ; Swap array[di] and array[cx]
    mov al, array[di]
    mov bl, array[bx]
    mov array[bx], al
    mov array[di], bl

    ; Move to the next iteration of the outer loop
    loop outerLoop

    ret

