; multi-segment executable file template.

   showmessage MACRO myMessage        
          MOV AH,09H
          mov dx, offset myMessage
          INT 21H   
   ENDM showmessage    
    moveCursor MACRO TOPLEFT,DOWNRIGHT          
          MOV AH,02      ; BOTTOM RIGHT
          MOV DL,TOPLEFT  ; TOP LEFT    ROW AND COL
          MOV DH,DOWNRIGHT ; DOWN RIGHT ROW AND COL                                       
          MOV BH,00 ; PAGE NUMBER
          INT 10H
    ENDM moveCursor
    getString MACRO INDATA
        mov AH ,0AH 
        MOV DX,OFFSET INDATA
        INT     21H 
    ENDM getString 
        

.MODEL SMALL 
.STACK 64 
.DATA 


ARRLEN EQU $-ARRAY

INPUT  DB 'Enter your name ','$' 
response db 30,?,30 DUP('$')
LEN EQU 22D
    
.CODE 
MAIN PROC FAR 
     MOV AX, @DATA 
     MOV DS,AX
                                                    
     
     moveCursor 20,15 
     showmessage INPUT 
     getString response  
     
     moveCursor 20,17   
     showmessage response+2
           
     HLT
    
MAIN ENDP     
END MAIN 
