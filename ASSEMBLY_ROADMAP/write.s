; Programa para printar um texto no terminal

global _start                  ; Agora usando start o linker não reclamará

section .text

_start:
	mov rax, 1                 ; 1 em rax leva a syscall para write
	mov rdi, 1                 ; 1 em rdi leva a syscall para stdout
	mov rsi, msg               ; msg é o endereço do texto
	mov rdx, 13                ; 13 é o tamanho do texto
	syscall                    ; Chama a syscall -> write(1, msg, 13)

	; Sair do programa
	mov rax, 60                ; 60 em rax leva a syscall para exit
	xor rdi, rdi               ; Isto é uma maneira mais rápida em termos de performance de dar 0 a rdi
	syscall                    ; Chama a syscall -> exit(0)

; Secção de variáveis
section .data
	msg: db "Hello, World", 10 ; msg vai ser trocada por um endereço de memória e sempre que for chamada
                               ;  vai estar a referir-se a este endereço
                               ; db é 8 bits, ou seja, 1 byte "type"
							   ; 10 é o código ASCII para o newline

; Fun fact:
; Adicionando mais texto a msg sem alterar o valor de rdx, o texto extra não será printado nem irá causar erros
; Isto acontece porque o valor de rdx é o tamanho do texto a ser printado e não o tamanho de msg
