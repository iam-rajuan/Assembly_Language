.MODEL
.STACK 100H 

.DATA
A DB 'INTER FIRST NUMVER $'
B DB 'INTER SECOND NUMBER $'
C DB 'INTER THIRD NUMBER $'
D DB 'RESULT $' 


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    ;FIRST INPUT
    MOV AH,9
    LEA DX,A
    INT 21H 
    
    MOV AH,1
    INT 21H
    MOV BL,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H 
    
    
    
    ;SECOND INPUT
    MOV AH,9
    LEA DX,B
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV BH,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H  
    
    
    ;THIRD INPUT
    MOV AH,9
    LEA DX,C
    INT 21H
    
    MOV AH,1
    INT 21H
    MOV CL,AL
    
    MOV AH,2
    MOV DL,10
    INT 21H
    MOV DL,13
    INT 21H
    
    
    ADD BL,BH
    SUB BL,48
    ADD BL,CL
    SUB BL,48 
    
    MOV AH,9
    LEA DX,D
    INT 21H
    
    MOV AH,2
    MOV DL,BL
    INT 21H
    
    
   
 
    
    EXIT:
    MOV AH,4CH
    INT 21  
    
    
    MAIN ENDP
END MAIN
    
           
          
    
    