section .data
	msg db "BMW S1000 RR", 10 ;db -define byte:convert each char into byte
	len equ $-msg ; len = $(ending address of the string) - msg(starting address of the string)

section .text ; executable machine instructions 
	global _start ;this line is for the linker 

_start:   ;the execution begins 

	mov rax,1 ;general purpose register, rax stores system calls[0-read,1-write,]
	mov rdi,1 ;contains first argument for the write(file decriptor, buffer, length)
	          ;file decrypter is the small integer used by the os to identify IO stream
		  ;0 - stdin(keyboard), 1 - stdout(terminal), 2 - stderr(terminal for error msg)
	mov rsi,msg ; rsi contains the address where the string "..." begins 
	mov rdx,len
	syscall

	; exit(0)
	mov rax,60 ;rax = 60 means exit 
	xor rdi,rdi
	syscall
