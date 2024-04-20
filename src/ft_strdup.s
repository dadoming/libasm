
global ft_strdup

section .text
extern ft_strlen
extern ft_strcpy
extern malloc

ft_strdup:
  ; Arguments:
  ;  rdi - const char *s1
  xor rax, rax          ; set rax to 0

  cmp rdi, 0
  je done

  ; storing in the rax register the length of the string
  mov rbx, rdi          ; save the pointer to the string -> rbx
  call ft_strlen
  inc rax

  mov rdi, rax          ; store the length of the string in rdi
  call malloc wrt ..plt ; here one would link with -no-pie, since we can't use it, then we use the PLT(Procedure Linkage Table) to call malloc
  test rax, rax         ; check if malloc failed
  jz malloc_failed      ; jump if zero

  mov rdi, rax          ; store the address of the allocated memory in rdi
  mov rsi, rbx          ; store the address of the string in rsi
  call ft_strcpy        ; copy the string to the new allocated memory

  done:
    ret

  malloc_failed:
    mov rax, 0          ; return 0
; add errno
