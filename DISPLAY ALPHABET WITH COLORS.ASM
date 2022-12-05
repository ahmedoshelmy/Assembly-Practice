.MODEL small

.DATA 


CHOSEN DB 20,?,20 DUP('C')
ALPHA DB 'AA','$'




MOVECURSORRIGHT MACRO 
mov ah,2
INC DL
int 10h
ENDM MOVECURSORRIGHT
 

MOVECURSORDOWN MACRO
mov ah,2
INC DH
MOV DL,0
int 10h
ENDM MOVECURSORDOWN


DISPLAYSTR MACRO STR 
LEA SI,STR
mov ah,9 ;Display
mov bh,0 ;Page 0
mov al,[SI] ;Letter D
mov cx,1h ;1 times
int 10h 
MOVECURSORRIGHT  
INC SI 
mov ah,9 ;Display
mov bh,0 ;Page 0
mov al,[SI] 
mov cx,1h ;1 times
int 10h
DEC SI
ENDM DISPLAYSTR
    
READSTR MACRO  INPUT
mov ah,07
int 21h
LEA DI,INPUT  
MOV [DI],AL
INC DI
INT 21H            
MOV [DI],AL            
ENDM READSTR

.CODE
MAIN PROC FAR 
MOV AX,@DATA
MOV DS,AX 
    
READSTR CHOSEN 
 
L2:   
LEA SI,ALPHA
CMP [SI] , 'Z' 
JG  BYEBYE 
INC SI 
MOV [SI],'A'                                                                               
JMP L1
LOOP1:
MOVECURSORDOWN
DEC SI
INC [SI]
JMP L2






 
L1:    
MOV BL,0FH ; WHITE COLOR TEXT
LEA SI,ALPHA
LEA DI,CHOSEN                                       
lodsb
DEC SI                                                                                    
cmp [di], al                              
je EQUAL1
JMP CONTINUE
CONTINUE2:
DEC SI
CONTINUE:
DISPLAYSTR ALPHA 
MOVECURSORRIGHT
MOVECURSORRIGHT
INC SI
MOV AH , [SI]  
INC [SI]  
CMP AH , 'Z' 
JNE L1 ; REPEAT TILL Z
JMP LOOP1





EQUAL1: 
INC SI 
INC DI 
MOV AL,[SI]                                                                                    
cmp [di], al  
JE CHANGECOLOR 
JMP CONTINUE2


CHANGECOLOR:
MOV BL,0CH ; RED COLOR
JMP CONTINUE2                           
  
BYEBYE :
MOV AH,04CH 
INT 21H
MAIN ENDP
END MAIN
