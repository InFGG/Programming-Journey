;this file is a hello world program for linux, teaching me syscalls and how to write things to stdout
;rax is the syscall number
;rdi is argument 1
;rsi is argument 2
;rdx is argument 3
;r10 is argument 4
;r8 is argument 5
;r9 is argument 6

;sys_write is syscall 1
;it takes 3 arguments, "write(file descriptor, buffer, count)"
;So:
;rax = 1
;rdi = file descriptor
;rsi = buffer (the memory location, in this case hello world)
;rdx = count (length of the message)
;syscall

;some basic file descriptors:
;0 = stdin
;1 = stdout
;2 = stderr

;for strings we can use sections to store the data in memory:
;section .data
;msg db "Hello world!", 10
;db is define bytes, and the 10 at the end is equivilent to a new line character

;to actually get that address we do:
;mov rsi, msg
;we only need the address of the msg, not the contents, this is why we use msg and NOT [msg]

;to find the length of the string we can do:
;len equ $ - msg
;equ defines a constant, $ means the current location, and $ - msg means the amount of bytes between the current location and msg

;we put the code in the section:
;section .text
;then we do:
;global _start
;and this makes _start visible to the linker
;_start: is our entry point

;to end we use
;rax = 60
;this is sys_exit and it needs one argument, exit(status)
;so we do:
;rax = 60
;rdi = 0
;syscall
;a status of zero is a successful exit

;here is the full program:
section .data ;data goes here
msg db "Hello world!", 10 ;loads the string "Hello world!" into memory with a new line character afterwards
len equ $ - msg ;checks the length of msg

section .text ;code goes here
global _start

_start:
mov rax, 1 ;sys_write
mov rdi, 1 ;stdout
mov rsi, msg ;loads the memory address into rsi
mov rdx, len ;loads the length of msg into rdx
syscall

mov rax, 60 ;sys_exit
mov rdi, 0 ;exit status 0
syscall