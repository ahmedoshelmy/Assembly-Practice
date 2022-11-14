org 100h

.data
   bin db "0000000000$"
   arr db 3 dup<?>   
   Enter db "Enter a string" , '$'
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
 getString MACRO INDATA
        mov AH ,0AH 
        MOV DX,OFFSET INDATA
        INT     21H 
    ENDM getString 
        
 
get macro mynum
    mov ah, 07
    int 21h
    mov dl, al
    sub al, '0'
    mov mynum, al
    mov ah, 2
    int 21h
endm get 
        
        
videomode macro
    mov AH ,0 
    mov al,13H 
    INT 10H
endm videomode   

scroll macro 
  mov ax,0600h
mov bh,07 
mov cx,0 
mov dx,0
int 10h  
endm scroll
                  
                  
                  
drawline macro 
    mov cx,0 ;Column
mov dx,50 ;Row
mov al,5 ;Pixel color
mov ah,0ch ;Draw Pixel Command
back: int 10h
inc cx
cmp cx,32
jnz back

endm drawline     

getKeyboard macro
mov ah,0
int 16h    
endm getKeyboard

        
textmode macro
    mov AH ,0 
    mov al,0 
    INT 10H
endm textmode
main proc 
    MOV AX,@DATA
    MOV DS, AX 
    displayString Enter 
    getString    bin 
    videomode
    drawline
    mov cx,3   
    lp: 
        getKeyboard   
    loop lp  
    
    mov ah,0 
mov al,0h
int 10h 

    
       scroll

    
    hlt

ret
