ORG 100H

.DATA
AR DB 9 DUP(0)

W1 DB 'ENTER YOUR ARRAY: $'
W2 DB 'SUM OF ODD NUMBERS : $'   
W3 DB 'SUM OF EVEN NUMBERS : $'   
SUM1 DB 0
SUM2 DB 0

.CODE

MAIN PROC 
    
    MOV AX,@DATA
    MOV DS,AX

    LEA DX,W1
    MOV AH,9
    INT 21H
    
    MOV SI,0
    MOV CX,0
    MOV CL,9
    
    INPUT:
       MOV AH,1
       INT 21H
       SUB AL,48
       MOV AR[SI],AL
       INC SI
    LOOP INPUT
    
       MOV SI,0
       MOV CL,9
       MOV DX,0
       MOV AX,0
       
    RAJUAN: 
    
       MOV AL,AR[SI]
       MOV BL,2
       DIV BL
       CMP AH,0
       
       JE EVEN
        
    ODD:
       MOV BX,0
       MOV BL,AR[SI]
       ADD SUM1,BL
       
       JMP BLANK
       
    EVEN:
       MOV BX,0
       MOV BL,AR[SI]
       ADD SUM2,BL   
       
    BLANK:
       INC SI
    LOOP RAJUAN
       
       MOV DL,10
       MOV AH,2
       INT 21H
       MOV DL,13
       INT 21H
       
       LEA DX,W2
       MOV AH,9
       INT 21H
       MOV AX,0
       MOV AL, SUM1
       MOV BL, 10
       DIV BL
       
       MOV BL,AL
       MOV BH,AH
       
       MOV DL,BL
       ADD DL,48
       MOV AH,2
       INT 21H
       MOV DL,BH
       ADD DL,48
       MOV AH,2
       INT 21H
       
       MOV DL,10
       MOV AH,02 
       INT 21H
       MOV DL,13
       MOV AH,2
       INT 21H
       
       LEA DX,W3
       MOV AH,9
       INT 21H
       
       MOV AX,0
       MOV AL,SUM2
       MOV BL,10
       DIV BL
       
       MOV BL,AL
       MOV BH,AH
       
       MOV DL,BL
       ADD DL,48
       MOV AH,2
       INT 21H
       
       MOV DL,BH
       ADD DL,48
       MOV AH,2
       INT 21H
       

MAIN ENDP
END MAIN
       
RET       
      
       
       
       
       
       
       