ORG 100H

.MODEL SMALL
.DATA
AR DB 9 DUP(0)

;DISPLAY DB 'ENTER TWO DIGIT NUMBER: $'
    C DW ?
    
.CODE
MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX  
    
    MOV AX,1000
    SUB AX,32
    MOV CX,5
    MUL CX
    
    MOV CX,9
    DIV CX
    ADD AX,1
    MOV C,AX
    
    
 
MAIN ENDP
END MAIN
    
      
