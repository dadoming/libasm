global ft_read

section .text
extern __errno_location
ft_read:
  ; Arguments:
  ;   rdi: file descriptor
  ;   rsi: buffer
  ;   rdx: count
  ; Return value:
  ;   rax: number of bytes read

  mov rax, 0 ; syscall number for sys_read
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
