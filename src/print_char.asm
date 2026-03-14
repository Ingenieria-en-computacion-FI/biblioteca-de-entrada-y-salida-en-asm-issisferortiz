SECTION .data
char db 0

SECTION .text
global print_char

; ---------------------------------
; print_char
; Entrada:
;   AL = caracter a imprimir
; ---------------------------------

print_char:

    push ebp
    mov ebp, esp

    ; guardar caracter
    mov [char], al

    ; syscall write
    mov eax, 4      ; syscall write
    mov ebx, 1      ; stdout
    mov ecx, char   ; direccion del caracter
    mov edx, 1      ; imprimir 1 byte
    int 0x80

    mov esp, ebp
    pop ebp
    ret