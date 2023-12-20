.model
.stack 100h
.data

msg1 db 'enter the number $'
msg2 db 'the number even $'
msg3 db 'the number odd $'    

.code
main proc
    
    mov ax,@data
    mov ds,ax 
    
    lea dx,msg1    
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    mov bl,2
    div bl
    
    cmp ah,0
    je even
     
    lea dx,msg2    
    mov ah,9
    int 21h
    
    even:
    mov ah,9
    lea dx,msg2
    int 21h
    
    
    
    main endp
end main
    
    

    
    