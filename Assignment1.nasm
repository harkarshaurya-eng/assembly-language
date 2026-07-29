;Using the concepts of Macro, syscall , data section and text section, develop X86/64-bit program.

section .data
  msg db "I am rich!",10
  len equ $-msg

%macro print 2
  mov rax,1
  mov rdi,1
  mov rsi,%1
  mov rdx,%2
  syscall
%endmacro

section .text
  global_start

_start:
        print msg,len

;exit 0

mov rax,60
xor rdi,rdi
syscall
