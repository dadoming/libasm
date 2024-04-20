global ft_strcpy

section .text
extern ft_strlen

ft_strcpy:
    ; Arguments:
    ;   rdi: Destination pointer (char* dest)
    ;   rsi: Source pointer (const char* src)
    ; Return:
    ;   rax: Destination pointer (char* dest)

  mov rdx, 0              ; Initialize the counter
  loop:
    mov al, [rsi + rdx]   ; Copy the byte at the source pointer[counter]
    mov [rdi + rdx], al   ; Copy the byte to the destination pointer[counter]
    cmp al, 0             ; Check if the byte just copied is the null terminator ('\0')
    je done               ; If yes, jump to the end of the function
    inc rdx               ; Increment the counter
    jmp loop

  done:
    mov rax, rdi
    ret
