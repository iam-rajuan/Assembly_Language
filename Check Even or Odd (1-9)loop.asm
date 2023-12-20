.MODEL
.STACK 100H
.DATA
A DB 'LOOP CONCEPT $'
MSG1 DB 'Enter a number (1-9): $'
MSG2 DB 'The number is even. $'
MSG3 DB 'The number is odd. $'
SUM DW 0 ; Variable to store the sum of even numbers

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    ; Display the string
    MOV AH, 9
    LEA DX, A
    INT 21H
    
    ; Move to the next line
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H

    ; Initialize loop counter
    MOV CX, 9
    
    INPUT_LOOP:
    ; Get user input
    MOV AH, 9
    LEA DX, MSG1
    INT 21H
    
    MOV AH, 1
    INT 21H

    ; Check if the number is even or odd
    MOV BL, 2
    DIV BL
    
    CMP AH, 0
    JE IS_EVEN
    
    ; Display message for odd numbers
    MOV AH, 9
    LEA DX, MSG3
    INT 21H
    JMP CONTINUE_LOOP
    
IS_EVEN:
    ; Display message for even numbers
    MOV AH, 9
    LEA DX, MSG2
    INT 21H
    
    ; Add even number to SUM
    ADD SUM, AX

CONTINUE_LOOP:
    ; Move to the next line
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H

    ; Decrease loop counter
    LOOP INPUT_LOOP

    ; Display the sum of even numbers
    MOV AH, 9
    MOV DX, OFFSET SUM ; Access the value of SUM
    INT 21H
    
    ; Exit the program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
