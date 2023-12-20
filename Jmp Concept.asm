.MODEL
.STACK 100H
.DATA
A DB 'JMP CONCEPT $'
B DB 'ASSEMBLY LANGUAGE $'
C DB 'PROGRAMMING $'
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
    
    M:
    MOV AH,9
    LEA DX,C
    INT 21H
    
    ;MODIFY NEW LINE
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    
    JMP  N 
     
    
    N:
    MOV AH,9
    LEA DX,B
    INT 21H  
    
    EXIT:
    MOV AH,4CH
    INT 21  
    
    
    MAIN ENDP
END MAIN
    
           
          
    
    