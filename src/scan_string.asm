SECTION .text
global scan_string

; ---------------------------------
; scan_string
; Entrada:
;   EAX = buffer destino
;   EBX = tamaño máximo
; ---------------------------------

scan_string:

    push ebp
    mov ebp, esp

    mov ecx, eax        
    mov edx, ebx        

    mov eax, 3          
    mov ebx, 0          
    int 0x80

    mov esi, ecx
    add esi, eax
    dec esi

    cmp byte [esi], 10
    jne end_scan

    mov byte [esi], 0
    jmp exit

end_scan:
    mov byte [ecx+eax], 0

exit:

    mov esp, ebp
    pop ebp
    ret