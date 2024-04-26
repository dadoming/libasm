global	ft_strlen

section	.text

ft_strlen:
; Arguments:
;   rdi: string
; Return:
;   rax: length of s

  mov		rax, 0		; set rax to 0
  jmp		loop			; jump to loop

  loop:
    cmp		BYTE [rdi + rax], 0	; check null byte
    je		done	              ; je is jump if equal which means if null byte is found jump to done
    inc		rax	                ; increment rax by one
    jmp   loop				      ; jump back to loop

  done:
    ret
