ORG 100H
.MODEL
.DATA
MYARRAY DB 10,12,30,40,50
ARRAYSIZE DW 5
SEARCHVALUE DB 50
FOUND_MSG DB "VALUE FOUND $"
NOT_FOUND_MSG DB "VALUE NOT FOUND $"

.CODE

MAIN PROC
   
    MOV AX,@DATA
    MOV DS,AX
   
    MOV CX,0
    MOV DX,ARRAYSIZE
   
    BINARY_SEARCH:
   
      CMP CX,DX
      JG VALUE_NOT_FOUND
   
      MOV SI,CX
      ADD SI,DX
      SHR SI,1
     
      MOV AL,[MYARRAY+SI]
      CMP SEARCHVALUE,AL
     
      JE VALUE_FOUND
     
      JL UPDATE_HIGH
     
      JG UPDATE_LOW
     
      UPDATE_LOW:
        INC SI
        MOV CX,SI
        JMP BINARY_SEARCH

      UPDATE_HIGH:
        DEC SI
        MOV DX,SI
        JMP BINARY_SEARCH
     
      VALUE_FOUND:
      MOV AH,9
      LEA DX,FOUND_MSG
      INT 21H
      JMP END_PROGRAM
      VALUE_NOT_FOUND:
      MOV AH, 9
      LEA DX, NOT_FOUND_MSG
      END_PROGRAM:
      MOV AH,4CH
      INT 21H

MAIN ENDP
END MAIN

   