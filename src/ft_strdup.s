
global ft_strdup

section .text
extern ft_strlen
extern malloc
extern ft_strcpy
extern __errno_location

ft_strdup:
  ; Arguments:
  ;  rdi - const char *s1
  xor rax, rax          ; set rax to 0

  cmp rdi, 0
  je done

  ; storing in the rax register the length of the string
  call ft_strlen
  inc rax

  push rdi
  mov rdi, rax          ; store the length of the string in rdi
  call malloc wrt ..plt ; here one would link with -no-pie, since we can't use it, then we use the PLT(Procedure Linkage Table) to call malloc
  test rax, rax         ; check if malloc failed
  jz malloc_failed      ; jump if zero
  pop rdi               ; pop the original string into rdi


  mov rsi, rdi
  mov rdi, rax
  call ft_strcpy
  ret


  jmp done
  done:
    ret

  malloc_failed:
    mov rdi, 12           ; Error number for ENOMEM
    call __errno_location wrt ..plt
    mov rax, 0            ; return NULL
    ret
