global ft_strcmp

section .text


ft_strcmp:
  ; Arguments:
  ;   rdi: first string
  ;   rsi: second string
  ; Return:
  ;   rax: 0 if strings are equal, positive if first string is greater, negative if second string is greater

  loop:
	mov al, [rdi]
	mov bl, [rsi]
	cmp al, bl

	cmp al, 0
	je done
	cmp bl, 0
	je done

	cmp al, bl
	jne done

	inc rdi
	inc rsi
	jmp loop

  done:
	; movzx makes sure that the value is zero extended, meaning that the upper bits are set to zero
	; while mov just copies the value as is and the upper bits are not cleared (set to 0)
	movzx rax, al
	movzx rbx, bl
	sub rax, rbx
	ret
