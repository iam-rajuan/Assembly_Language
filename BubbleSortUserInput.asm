org 100h

.data
    str     db 10,13,"Enter Values: $"
    str1    db 0dh,0ah,"Bubble Sorted: $"
    array   db 10 dup(0)

.code
    ; Display "Enter Values:" prompt
    mov ah, 9
    lea dx, str
    int 21h

    ; Input loop to read 10 values into the array
    mov cx, 10
    mov bx, offset array
    mov ah, 1

inputs:
    int 21h
    mov [bx], al
    inc bx
    loop inputs

    ; Bubble Sort Algorithm
    mov cx, 10
    dec cx

nextscan:
    mov bx, cx
    mov si, 0

nextcomp:
    mov al, array[si]
    mov dl, array[si + 1]
    cmp al, dl
    jc noswap

    ; Swap elements if needed
    mov array[si], dl
    mov array[si + 1], al

noswap:
    inc si
    dec bx
    jnz nextcomp
    loop nextscan

    ; Display "Bubble Sorted:" prompt
    mov ah, 9
    lea dx, str1
    int 21h

    ; Output loop to print the sorted array
    mov cx, 10
    mov bx, offset array

print:
    mov ah, 2
    mov dl, [bx]
    int 21h
    inc bx
    loop print

    ; Exit
    ret
