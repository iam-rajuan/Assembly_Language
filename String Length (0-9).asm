ORG 100H
.MODEL
.STACK 100H 

.DATA
ESTR DB 13,10,'ENTER A STRING: $'
STR DB 100 DUP('$')
SLENGTH DB 13,10, 'LENGTH OF STRING WITH SPACES: $'
SLEN DB 0


.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
   
    MOV DX,OFFSET ESTR
    MOV AH,9
    INT 21H
    
    MOV SI,OFFSET STR
    L:    
    MOV AH,1
    INT 21H
    MOV [SI],AL
    CMP [SI],13
    JE ENTER
    INC SI
    INC SLEN
    LOOP L
   
    ENTER:
     MOV DX,OFFSET SLENGTH
     MOV AH,9
     INT 21H
     
     MOV DL,SLEN 
     ADD DL,48
     MOV AH,2
     INT 21H
     
    EXIT:
    MOV AH,4CH
    INT 21  
    
    
    MAIN ENDP
END MAIN
    
           
          
    
    