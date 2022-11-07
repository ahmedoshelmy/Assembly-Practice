.MODEL SMALL 
.STACK 64 
.DATA 


ARRLEN EQU $-ARRAY

INPUT  DB 'THis iS A TEsT MESsaGE' 
LEN EQU 22D
    
.CODE 
MAIN PROC FAR 
     MOV AX, @DATA 
     MOV DS,AX
                                                    
     
     LEA SI,INPUT 
     
     MOV CX,LEN 
     CHANGE: 
        MOV AL, [SI] ;
        
        CMP AL,0DH;  
        JZ EXIT; 
        
    
        CMP AL,60H;  
        JL LOWER ;
        INC SI;
     LOOP CHANGE   
     JMP EXIT
     
     LOWER:
        ADD AL,20H  ;
        MOV [SI],AL;  
     JMP CHANGE
           
     EXIT:
           
     HLT
    
MAIN ENDP     
END MAIN 
