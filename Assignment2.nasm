;Develop X86/64-bit program to accept a string and to display its length.

section .bss
  Name resb 50
section .data
  msg db "Enter your name:",10
  len equ $-msg
%macro PrintName 1
  ;read name
  mov rax,0
  mov rdi,0
  mov rsi,%1
  mov rdx,50
  syscall

mov rdx,rax ;because return value of syscall is stored in rax, 

  ;print the name 
  mov rax,1
  mov rdi,1
  mov rsi,%1
  syscall
%endmacro

  section .text
      global _start

    _start:

            mov rax,1
            mov rdi,1
            mov rsi,msg
            mov rdi,len
            syscall

      PrintName Name

mov rax,60
xor rdi,rdi
syscall
  
