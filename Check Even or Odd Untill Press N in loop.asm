.MODEL
.STACK 100H
.DATA
A DB 'LOOP CONCEPT $'
MSG1 DB 'Enter a number or "N" to exit: $'
MSG2 DB 'The number is even. $'
MSG3 DB 'The number is odd. $'

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

    INPUT_LOOP:
    ; Get user input
    MOV AH, 9
    LEA DX, MSG1
    INT 21H
    
    MOV AH, 1
    INT 21H
    
    ; Check if the user wants to exit
    CMP AL, 'N'
    JE EXIT

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

CONTINUE_LOOP:
    ; Move to the next line
    MOV AH, 2
    MOV DL, 10
    INT 21H
    MOV DL, 13
    INT 21H

    JMP INPUT_LOOP

EXIT:

    ; Exit the program
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN
