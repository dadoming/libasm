; Este ficheiro não é executável por si só. Ele é um ficheiro de código que será
; chamado no ficheiro de código principal em C.

global asm_func         ; Declaramos a função como global para que possa ser
						; chamada a partir do código em C.

section .text

asm_func:
  mov rax, -1           ; Teste para retornar um número negativo.
						; No programa de C, definiu-se que a função
						; retornaria um unsigned int. No entanto, o
						; valor retornado é um número negativo.

  ret					; Retorna o valor de rax.
