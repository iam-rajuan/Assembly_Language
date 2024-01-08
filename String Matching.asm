ORG 100H

.DATA

STR1 DB "HELLO$"
STR2 DB "HELLO $"

COUNT1 DB 0
COUNT2 DB  0

MSG1 DB "ACCESS GRANTED$"
MSG2 DB "ACCESS NOT GRANTED$"

.CODE  

MAIN PROC
MOV AX, @DATA
MOV DS, AX

MOV SI, OFFSET STR1

NEXT: MOV AL, [SI]
CMP AL, '$'
JE EXIT


INC SI
INC COUNT1
JMP NEXT


EXIT:
MOV SI, OFFSET STR2

NEXT1: MOV AL , [SI]
CMP  AL, '$'
JE EXIT1

INC SI
INC COUNT2

JMP NEXT1


EXIT1:
MOV AL, COUNT1
CMP AL, COUNT2
JNE EXIT2

CLD

MOV CH, 0
MOV CL, COUNT1
MOV SI, OFFSET STR1
MOV DI, OFFSET STR2

UP:

JNZ EXIT2

LOOP UP
MOV AH, 9H
LEA DX, MSG1
INT 21H
JMP EXIT3

EXIT2:
MOV AH, 9H
LEA DX, MSG2
INT 21H

EXIT3:
MOV AH, 4CH
INT 21H


RET