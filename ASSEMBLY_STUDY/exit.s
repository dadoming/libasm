;
;                         ROADMAP
;      https://github.com/yds12/x64-roadmap/tree/master
;

global func_name ; Isto é o qye torna possível o sistema operativo encontrar a função fora do executável.
                 ; E é o que também torna possível ser chamada.

section .text    ; Esta é a secção onde o código é colocado.

func_name:       ; Este é o entry point do programa. Vai ser traduzido para um endereço de memória.
	mov rax, 60  ; Coloca o valor 60 no registo rax.
	mov rdi, 0   ; Coloca o valor 0 no registo rdi.
	syscall      ; Faz a chamada ao sistema operativo. O sistema operativo toma controlo.
				 ; O tipo de chamada é especificado pelo valor no registo rax, neste caso 60, que significa exit.
				 ; O exit code é especificado pelo valor no registo rdi, neste caso 0.

; Testar também com o valor 1 no registo rdi, que significa exit code 1, 255, 256, -1, ...

; Para compilar usando o nasm e o ld:
; nasm -f elf64 <nome_do_ficheiro>.s -o <nome_do_ficheiro>.o
; ld <nome_do_ficheiro>.o -o <nome_do_ficheiro>
; ./<nome_do_ficheiro>
; Como o programa não possui uma main, ld atira um warning, mas o programa funciona na mesma.
; ld: warning: cannot find entry symbol _start; defaulting to 0000000000401000
