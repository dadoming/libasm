
global ft_strdup

section .text
extern ft_strlen
extern malloc

ft_strdup:
  ; Arguments:
  ;  rdi - const char *s1

  cmp rdi, 0
  je done

  push rdi
  call ft_strlen
  pop rdi

  inc rax
  mov rsi, rax
  call malloc WRT ..plt ; here one would link with -no-pie, since we can't use it, then we use the PLT(Procedure Linkage Table) to call malloc
  mov rdi, rax

  mov rcx, rsi
  mov rsi, rdi
  rep movsb
  done:
    ret
