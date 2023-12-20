org 100h
.model small
.stack 100h
.data
    Var1 DB "Enter a character: $"
    Var2 DB "The character is a vowel.$"
    Var3 DB "The character is a consonant.$"
    Next DB 0Dh, 0AH, "$"
    char DB ?

; 1st Macro 
DISPLAY_STRING MACRO str
    mov ah, 09
    LEA dx, str
    int 21h
ENDM

; 2nd Macro 
READ_CHAR MACRO
    mov ah, 01
    int 21h
ENDM

; 3rd Macro 
DISPLAY_RESULT MACRO isVowel
    DISPLAY_STRING Next
    DISPLAY_STRING isVowel
    jmp END
ENDM

.code
main proc 
    mov ax, @data
    mov ds, ax
    
    ; Display prompt
    DISPLAY_STRING Var1
    
    ; Read a character
    READ_CHAR
    ; Move the entered character to 'char'
    mov char, al
    
    ; Check if the character is a lowercase letter
    cmp char, 'a'
    jl NOT_VOWEL
    cmp char, 'z'
    jg NOT_VOWEL
    
    ; Check for vowels
    cmp char, 'a'
    je VOWEL
    cmp char, 'e'
    je VOWEL
    cmp char, 'i'
    je VOWEL
    cmp char, 'o'
    je VOWEL
    cmp char, 'u'
    je VOWEL
    
NOT_VOWEL:
    ; Display message for consonant
    DISPLAY_RESULT Var3
    jmp END
    
VOWEL:
    ; Display message for vowel
    DISPLAY_RESULT Var2
    
END:
    ; Terminate program
    mov ah, 4ch
    int 21h
    main endp
End main
