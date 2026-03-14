SECTION .bss
buffer_int resb 12

SECTION .text
global print_int

; -------------------------
; print_int
; Entrada: EAX = entero a imprimir
; -------------------------

print_int:

    push ebp
    mov ebp, esp

    mov ebx, eax
    mov edi, buffer_int
    add edi, 11
    mov byte [edi], 10
    dec edi

    xor ecx, ecx       

    cmp ebx, 0
    jge .convert

    neg ebx
    mov ecx, 1         

.convert:

    cmp ebx, 0
    jne .loop_digit

    mov byte [edi], '0'
    dec edi
    jmp .sign

.loop_digit:

    xor edx, edx
    mov eax, ebx
    mov esi, 10
    div esi

    add dl, '0'
    mov [edi], dl
    dec edi

    mov ebx, eax
    cmp ebx, 0
    jne .loop_digit

.sign:

    cmp ecx, 0
    je .print

    mov byte [edi], '-'
    dec edi

.print:

    inc edi            
    
    mov eax, 4
    mov ebx, 1
    mov ecx, edi
    mov edx, buffer_int + 12
    sub edx, edi                
    int 0x80

    mov esp, ebp
    pop ebp
    ret