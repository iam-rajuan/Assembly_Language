.model small
.data
    array db 5, 2, 9, 1, 5 ; Example array to be sorted
    n equ $ - array ; Number of elements in the array

.code
    mov ax, @data
    mov ds, ax

    call selectionSort

    ; Display the sorted array
    mov ah, 4ch
    int 21h

selectionSort:
    mov cx, n
    dec cx ; outer loop counter

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
    mov bl, array[si]
    mov array[si], al
    mov array[di], bl

    ; Move to the next iteration of the outer loop
    loop outerLoop

    ret

end main
