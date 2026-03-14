SECTION .bss
buffer_int resb 12

SECTION .text
global scan_int

scan_int:
    push ebp
    mov ebp, esp

    mov eax, 3
    mov ebx, 0
    mov ecx, buffer_int   
    mov edx, 12
    int 0x80

    
    mov esi, buffer_int
    xor eax, eax
    xor ebx, ebx
    cmp byte [esi], '-'
    jne .loop_chars
    inc esi
    mov bl, 1

.loop_chars:
    mov cl, [esi]
    cmp cl, 10
    je .done
    sub cl, '0'
    movzx ecx, cl
    imul eax, eax, 10
    add eax, ecx
    inc esi
    jmp .loop_chars

.done:
    cmp bl, 0
    je .exit
    neg eax

.exit:
    mov esp, ebp
    pop ebp
    ret