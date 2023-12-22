 org 100h
.data
msg1 db 'Alphabel$'
msg2 db 'digital$'
msg3 db 'Others$'

.code

main proc

;input

mov ah, 01h
int 21h

mov bl, al   ; move A to bl register


cmp bl, 30h  ; compare bl with ascii value of 01
jge print    ; if greater or equal jump to label print

print:       ; label print

cmp bl, 39h  ; compare bl with ascii value of 09
jle print1   ; if less or equal jump to label print1
jg end       ; if greater or equal jump to label print


; new line

mov ah, 02h    ; character output function
mov dl, 0Ah    ; line feed
int 21h        ; dos interrupt
mov dl ,0Dh    ; Carriage return
int 21h        ; dos interrupt
       
print1:
mov ax, @data
mov ds, ax
mov ah, 09h
lea dx, msg2
int 21h
ret

end:

cmp bl, 41h
jge print2

print2:
cmp bl, 5Ah
jle print3
jge print4

print3:
mov ax, @data
mov ds, ax
mov ah, 09h
lea dx, msg1
int 21h
ret


cmp bl, 7Ah
jge end1

print4:
mov ax, @data
mov ds, ax
mov ah, 09h
lea dx, msg1
int 21h
ret


end1:
mov ax, @data
mov ds, ax
mov ah, 09h
lea dx, msg3
int 21h
ret


     
main endp
endp