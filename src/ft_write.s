global ft_write

section .text
extern __errno_location

ft_write:
  ; Arguments:
  ;   rdi: file descriptor
  ;   rsi: buffer
  ;   rdx: count
  ; Return:
  ;   rax: number of bytes written

    mov rax, 1    ; write syscall
    syscall

    cmp rax, 0
    jl error_handler
    ret

  error_handler:
    neg rax
    mov rbx, rax
    call __errno_location wrt ..plt
    mov [rax], rbx
    mov rax, -1
    ret
