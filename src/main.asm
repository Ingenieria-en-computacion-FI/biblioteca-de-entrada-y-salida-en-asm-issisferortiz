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

    mov ecx, eax      
    mov esi, eax
    xor edx, edx      

count_loop:
    cmp byte [esi], 0
    je print
    inc esi
    inc edx
    jmp count_loop

print:
    mov eax, 4       
    mov ebx, 1       
    int 0x80

    mov esp, ebp
    pop ebp
    ret