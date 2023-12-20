   .model
   .stack 100h
   .data
   msg db 7
   msgs db ?
   
   .code
   main proc
    
    mov ax,@data
    mov ds,ax
    
    
    mov ah,2
    
    add msg,48
    
    mov dl,msg
    int 21h
    
    
    mov ah,1
    int 21h
    mov msgs,al
    
    mov ah,2
    mov dl,10
    int 21h
    mov dl,13
    int 21h
    
    mov ah,2
    mov dl,msgs
    int 21h
    
    main endp
   end main
    
    