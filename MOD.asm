.MODEL SMALL
.STACK 100H
.DATA
    S1 DB 0AH,0DH,"Enter the first number:$"
    S2 DB 0AH,0DH,"Enter the second number:$"
    S3 DB 0AH,0DH,"Remainder is:$"
    
    V1 DB ?
    V2 DB ?
.CODE  
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,S1
    MOV AH,09H
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV V1,AL
    
    
    LEA DX,S2
    MOV AH,09H
    INT 21H
    
    MOV AH,01H
    INT 21H
    SUB AL,30H
    MOV V2,AL
             
    MOV AL,V1
    MOV AH,00H
    DIV V2
    MOV BL,AH
    
    LEA DX,S3
    MOV AH,09H
    INT 21H 
    
    ADD BL,30H
    MOV DL,BL
    MOV AH,02H
    INT 21H
    
    MOV AH,04CH
    INT 21H
    MAIN ENDP
END MAIN
    
    



