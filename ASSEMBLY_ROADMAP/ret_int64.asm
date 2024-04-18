; Este ficheiro não é executável por si só. Ele é um ficheiro de código que será
; chamado no ficheiro de código principal em C.

global asm_func          ; Declaramos a função como global para que possa ser
						 ; chamada a partir do código em C.

section .text

asm_func:
	mov rax, 10000000000 ; 10 bil (não cabe num inteiro de 32 bits)
	ret                  ; Retornamos o controlo para o código em C
