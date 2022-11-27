

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
MOV AX,@Data
MOV DS,AX  

MOV SI ,OFFSET STRING  
MOV DX , LEN     
DEC DX 
MOV DI , OFFSET STRING
ADD DI,DX  
DEC DI 

L:

CMP SI,DI 
JGE YES    
MOV AH , [SI]
MOV BH, [DI] 
CMP AH,BH 
JNE NO  
INC SI
DEC DI 



JMP L 



YES: 
MOV AX,1  
SHOWMESSAGE PAL
JMP END 

NO:
SHOWMESSAGE NOTPAL 
MOV AX,0




END:



hlt
MAIN ENDP ;Ends the procedure 
END MAIN
