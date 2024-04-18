global ft_read

section .text

ft_read:
  ; Arguments:
  ;   rdi: file descriptor
  ;   rsi: buffer
  ;   rdx: count
	mov rax, 0 ; syscall number for sys_read
	syscall
	ret
