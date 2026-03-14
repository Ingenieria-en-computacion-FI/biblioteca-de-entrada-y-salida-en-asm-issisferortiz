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

    mov esi, eax        ; recorrer cadena
    mov ecx, eax        ; guardar dirección original
    xor edx, edx        ; longitud = 0

count_loop:
    cmp byte [esi], 0
    je print
    inc esi
    inc edx
    jmp count_loop

print:
    mov eax, 4          ; syscall write
    mov ebx, 1          ; stdout
    ; ecx = dirección
    ; edx = longitud
    int 0x80

    mov esp, ebp
    pop ebp
    ret