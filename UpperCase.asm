.MODEL SMALL
.STACK 100H
.DATA
    input_msg1 DB 'Enter an uppercase letter: $'   
    input_msg2 DB 0AH,0DH,'Enter an lowercase letter: $'
    result_msg1 DB 0AH,0DH, 'The lowercase letter is: $'
    result_msg2 DB 0AH,0DH, 'The uppercase letter is: $'
.CODE
MAIN PROC 
    MOV AX,@DATA         
    MOV DS,AX            
     
    LEA DX,input_msg1 
    MOV AH,09H                 
    INT 21H              
    
    MOV AH,01H             
    INT 21H              
    MOV BL,AL           
    
    LEA DX,result_msg1
    MOV AH,09H                 
    INT 21H              
    
    ; Display the converted lowercase letter
    MOV AH,2             
    ADD BL,20H            ; convert the uppercase letter to lowercase letter
    MOV DL,BL            
    INT 21H  
    
    LEA DX,input_msg2 
    MOV AH,09H                 
    INT 21H              
    
    MOV AH,01H             
    INT 21H              
    MOV BL,AL           
    
    LEA DX,result_msg2
    MOV AH,09H                 
    INT 21H              
    
    ; Display the converted uppercase letter
    MOV AH,2             
    SUB BL,20H            ; convert the lowercase letter to uppercase letter
    MOV DL,BL            
    INT 21H              
    
    
    MOV AH,4CH           
    INT 21H              
    MAIN ENDP
END MAIN