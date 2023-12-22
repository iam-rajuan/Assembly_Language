ORG 100H

.DATA
    AR DB 9 DUP(0)
    W1 DB 'ENTER YOUR NUMBER (TWO DIGITS): $'
    W2 DB ' DIVISIBLE BY 5  $'   
    W3 DB ' NOT DIVISIBLE BY 5  $'   
    SUM1 DB 0
    SUM2 DB 0

.CODE

MAIN PROC 
    
    MOV AX, @DATA
    MOV DS, AX

    LEA DX, W1
    MOV AH, 9
    INT 21H
    
    ; Input first digit
    MOV AH, 1
    INT 21H
    SUB AL, '0'   ; Convert ASCII to numeric value
    MOV AR, AL    ; Store the first digit

    ; Input second digit
    MOV AH, 1
    INT 21H
    SUB AL, '0'   ; Convert ASCII to numeric value
    MOV BL, AL    ; Store the second digit

    ; Combine digits to form a two-digit number
    MOV AX, 0
    MOV AL, AR
    MOV AH, 0
    MOV BH, 10
    MUL BH
    ADD AL, BL
    MOV AR, AL    ; Store the two-digit number in AR

    MOV AL, AR
    MOV BL, 5
    DIV BL

    CMP AH, 0
    JE DIVISIBLE_BY_5
    JMP NOT_DIVISIBLE_BY_5

DIVISIBLE_BY_5:
    LEA DX, W2
    MOV AH, 9
    INT 21H
    JMP RET

NOT_DIVISIBLE_BY_5:
    LEA DX, W3
    MOV AH, 9
    INT 21H

RET:
    ; Your program should end here, or you can add additional instructions as needed.

MAIN ENDP
END MAIN
