global ft_write

section .text


ft_write:
  ; Arguments:
  ;   rdi: file descriptor
  ;   rsi: buffer
  ;   rdx: count
	mov rax, 1    ; write syscall
	; mov rdi, rdi ; fd
	; mov rsi, rsi ; buf
	; mov rdx, rdx ; count
	syscall
	ret
