.MODEL
.STACK 100H
.DATA
A DB 'LOOP CONCEPT $'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    MOV AH,9
    LEA DX,A
    INT 21H
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    
    
    MOV CX,26
    MOV AH,2
    MOV DL,'A'
    
    LEVEL1:
    INT 21H
    INC DL
    LOOP LEVEL1
    
    EXIT:
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
    
    