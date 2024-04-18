global ft_strcpy

section .text

ft_strcpy:
    ; Arguments:
    ;   rdi: Destination pointer (char* dest)
    ;   rsi: Source pointer (const char* src)

    ; Loop through the source string until we encounter the null terminator ('\0')
  loop:
    mov al, [rsi] ; Load a byte from the source address into AL register (just one byte, check ASSEMBLY_ROADMAP/REGISTERS )
    mov [rdi], al  ; Store the byte at the destination address
    cmp al, 0  ; Check if the byte just copied is the null terminator ('\0')
    je done    ; If yes, jump to the end of the function
    ; Increment the source and destination pointers
    inc rsi  ; Move to the next byte in the source string
    inc rdi  ; Move to the next byte in the destination string
    ; Continue looping
    jmp loop
  done:
    ; Return to the calling function (rdi)
    ret
