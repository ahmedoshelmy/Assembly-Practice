

.MODEL SMALL
.STACK 64
.data     

showmessage MACRO myMessage        
          MOV AH,09H
          mov dx, offset myMessage
          INT 21H   
   ENDM showmessage    



STRING db 'EHHHE','$'
LEN EQU $-STRING  
PAL db 'PALINDROME','$'  
NOTPAL  db 'NOTPALINDROME','$'   


MAIN PROC FAR
mov ah,0
mov al,13h
int 10h
DPixel: mov al,5 ;Pixel color
mov ah,0ch ;Draw Pixel Command
int 10h
mov ax,3;Get mouse position in CX,DX- BX:Button status
GetPos: int 33h
cmp bl,1
jne GetPos
JMP DPixel

hlt
MAIN ENDP ;Ends the procedure 
END MAIN
