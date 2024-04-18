;• Your code must set the variable errno properly.
;• For that, you are allowed to call the extern ___error or errno_location.


;• The prototype of the function should be:
;size_t ft_strlen(const char *s);
global	ft_strlen

section	.text

ft_strlen:
  ; Arguments:
  ;   rdi: const char *s

	mov		rax, 0			; set rax to 0
	jmp		loop			; jump to loop
  loop:
	cmp		BYTE [rdi + rax], 0	; check null byte
	je		done	            ; je is jump if equal which means if null byte is found jump to done
    inc		rax	                ; increment rax by one
    jmp     loop				; jump back to loop
  done:
    ret
