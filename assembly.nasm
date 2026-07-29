section .bss
  Name resb 50
  digit resb 1
section .data
	msg db "Enter your name:",10
	len equ $-msg

	lenMsg db "Length:"
	lenMsglen equ $-lenMsg
; Read string entered by the user 
%macro ReadName 1
	mov rax,0
	mov rdi,0
	mov rsi,%1
	mov rdx, 50
	syscall

	mov rdx,rax
%endmacro
;Normal print macro
%macro Print 2
	mov rax,1
	mov rdi,1
	mov rsi,%1
	mov rdx,%2
	syscall
%endmacro
;print the string entered by the user
%macro PrintName 1
	mov rax,1
	mov rdi,1
	mov rsi,%1
	syscall
%endmacro
; macro to count the length of the string bytes read
%macro Printlength 0
	;rdx has the number of 
	dec rdx ;because we clicked the enter key after putting the string 
	add dl,'0';because linux doesn't print numbers, it prints characters so convert dl into ASCII
	mov[digit],dl 

	Print lenMsg, lenMsglen

	mov rax,1
	mov rdi,1
	mov rsi,digit
	mov rdx,1
	syscall
%endmacro

  section .text
      global _start

    _start:

	Print msg,len 
	ReadName Name
	PrintName Name
	Printlength

              
mov rax,60
xor rdi,rdi
syscall
