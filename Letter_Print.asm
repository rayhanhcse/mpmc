.MODEL SMALL
.STACK 100H
.DATA
    S1 DB 0AH,0DH,"The Capital Letters are: $"
    S2 DB 0AH,0DH,"The Small Letters are: $"
.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,S1
    MOV AH,09H
    INT 21H
     
    ; Print Capital Letters (A-Z) 
    MOV CX,26                  ; Set loop counter to 26
    MOV DL,"A"                 ; Start with ASCII value of 'A'
    
    PRINT_CAPITALS:
        MOV AH,02H               ; Function to display character
        INT 21H                ; Call DOS interrupt to display the character
        INC DL                 ; Increment to the next character
        LOOP PRINT_CAPITALS    ; Loop until CX becomes 0 
    
    LEA DX,S2
    MOV AH,09H
    INT 21H    
      
    ; Print Small Letters (a-z)
    MOV CX,26                  ; Set loop counter to 26
    MOV DL,"a"                 ; Start with ASCII value of 'a'
    
    PRINT_SMALLS:
        MOV AH,2               ; Function to display character
        INT 21H                ; Call DOS interrupt to display the character
        INC DL                 ; Increment to the next character
        LOOP PRINT_SMALLS      ; Loop until CX becomes 0
    
    ; Exit the program    
    MOV AH,4CH                 ; Function to exit the program
    INT 21H                    ; Call DOS interrupt to terminate the program
    MAIN ENDP
END MAIN