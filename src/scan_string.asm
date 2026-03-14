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

    mov ecx, eax        ; buffer destino
    mov edx, ebx        ; tamaño máximo

    ; syscall read
    mov eax, 3          ; read
    mov ebx, 0          ; stdin
    int 0x80

    ; eax ahora contiene la cantidad de bytes leídos
    mov esi, ecx
    add esi, eax
    dec esi

    ; reemplazar '\n' por terminador 0
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