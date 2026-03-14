SECTION .bss
char_buffer resb 1

SECTION .text
global scan_char

; ---------------------------------
; scan_char
; Salida:
;   AL = caracter leído
; ---------------------------------

scan_char:

    push ebp
    mov ebp, esp

    ; syscall read
    mov eax, 3        ; read
    mov ebx, 0        ; stdin
    mov ecx, char_buffer
    mov edx, 1        ; leer 1 byte
    int 0x80

    ; devolver caracter en AL
    mov al, [char_buffer]

    mov esp, ebp
    pop ebp
    ret