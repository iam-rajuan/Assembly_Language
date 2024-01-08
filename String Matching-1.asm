org 100h

.data
str1 db "COMPUTER"
str2 db "COMPUTER"
mes1 db "Access Granted $" 
mes2 db "Access Denied $"  

.code
assume cs:code, ds:data

start:
    mov ax, @data   
    mov ds, ax     

    mov si, offset str1 
    mov di, offset str2 

    cld            

    mov cx, 8      

    repe cmpsb      

    mov ah, 9       
    jz skip         

    lea dx, mes2   
    jmp over        
skip:
    lea dx, mes1    

over:
    int 21h         

    mov ax, 4c00h   
    int 21h        

end start           
ret