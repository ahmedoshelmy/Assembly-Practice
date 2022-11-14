org 100h

.data
   bin db "0000000000$"
   arr db 3 dup<?> 
.code      
displayString macro str
    mov ah,09h
    mov dx,offset str
    int 21h
endm displayString

moveCursor macro topleft,downright
    mov ah,02
    mov dl,topleft
    mov dh,downright
    mov bh,00
    int 10h
endm moveCursor 

 
get macro mynum
    mov ah, 07
    int 21h
    mov dl, al
    sub al, '0'
    mov mynum, al
    mov ah, 2
    int 21h
endm get 

main proc 
    MOV AX,@DATA
    MOV DS, AX 
 
 
 
    get arr 
    get arr+1
    get arr+2 
 
 
 
    mov al, 0
    add al, arr
    mov dl, 0Ah
    mul dl
    add al, arr+1
    mul dl
    add al, arr+2
    
    mov bl,2    
    ;mov ax,999
    lea di,bin+9
    lp:
    mov bl,0
    shr ax,1
    adc bl,0
    add bl,30h
    mov [di],bl
    dec di
    cmp ax,0
    jne lp
    moveCursor 20,15
    displayString bin
    
    
    
    
    hlt

ret
