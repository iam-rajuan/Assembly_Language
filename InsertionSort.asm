        include 'emu8086.inc'
        
       
        
        
       
         .model large
         
         .stack 100h
        
        .data 
        
        uno dw 0,6,5,1,5,3,8,4,7,890,9,2
         
        ;Variable Registers
        ; si contains value of i 
        ; DI contains the value of j
        ; AX contains the size of array 
        ; BX contaions the size-1 array
        ; size contains the size of array 
        
        size dw 22 
        swap_var dw 0 
        v1 dw 0
        v2 dw 0 
        
        ;These variables are used by print array procedure 
        nsi dw  0
        nax dw 0
        ndx dw 0
        ; End of variables print array procedure 
       .code 
        
        mov ax,@data
        mov ds,ax
        
        main proc 
               
            call insertion_sort
            call print_arr  
            .EXIT
        endp main
        
        insertion_sort proc 
          mov si, 2
          mov ax, size 
          
          for_loop:
            cmp si, ax
            jg end_for_loop
                
             
             while_loop:
                mov di, si
                sub di, 2
                mov bx, uno[si]
                 mov cx, uno[di]
                cmp si, 0
                jle end_while
                
                 
                 
                 cmp cx, bx
                 jle end_while
                  
                    mov swap_var, bx 
                    mov bx, cx
                    mov cx, swap_var
                    mov uno[si], bx
                    mov uno[di], cx
                    sub si, 2
                    jmp while_loop
             end_while:
            add si, 2
            jmp for_loop  
          end_for_loop:
            RET 
        endp insertion_sort
       
        print_arr proc
            ; Set the variables, So I wont lost the value of these registers 
             mov nsi, si
             mov nax, ax
             mov ndx, dx
             mov si, 0 
             mov ah,2 
                     
             mov dl, 0Ah 
             int 21h
             mov dl, 0Dh 
             int 21h 
              print "So, The array is "
            start_print:
                 mov ax, size
                 cmp si, ax 
                 
                 jg end_print 
                     ; Print the array content
                        
                      mov ax, uno[si]
                      call print_num
                      
                      
                      ;New line and carriage return
                      
                      
                    print ","  
                    add si,2
                 jmp start_print 
                   
              
             end_print:
              mov ah,2 
                      
                      mov dl, 0Ah 
                      int 21h
                      mov dl, 0Dh 
                      int 21h  
                mov si, nsi            
                mov ax, nax
                mov dx, ndx 
                ret 
                  
        endp print_arr
       
       
   
        
         define_scan_num 
         define_print_num
         define_print_num_uns