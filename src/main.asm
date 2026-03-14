SECTION .text
global print_string

; ---------------------------------
; print_string
; Entrada:
;   EAX = direccion de cadena
;   cadena terminada en 0
; ---------------------------------

print_string:

    push ebp
    mov ebp, esp

    mov ecx, eax      ; dirección de la cadena
    mov esi, eax
    xor edx, edx      ; longitud

count_loop:
    cmp byte [esi], 0
    je print
    inc esi
    inc edx
    jmp count_loop

print:
    mov eax, 4        ; syscall write
    mov ebx, 1        ; stdout
    int 0x80

    mov esp, ebp
    pop ebp
    ret