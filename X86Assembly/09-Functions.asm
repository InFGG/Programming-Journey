;this file explores the stack and ABI

;before we even run _start linux gives the program some memory and rsp is pointing at the top
;this makes programming easier as we dont have to manually allocate memory or mov rsp to specific addresses

;we can do push to add onto the top of the stack
;push 1 puts 1 ontop of the stack
;push 2 would then put 2 ontop of 1
;push 3 would then put 3 ontop of that 2

;we can then use pop to take from the top of the stack, it removes that from the stack completely so we can do;
;pop rax - this takes 3 off the top of the stack and put it into rax

;we can use this to write a basic program

section .text ;our code block
global _start

_start:
push 1
push 2
push 3 ;putting 3 values onto the stack, literally stacking them ontop of eachother

pop rax
pop rbx
pop rcx ;we take those 3 values off the stack and put them into the registers rax, rbx and rcx

mov rdi, rax ;this copies the value from rax into rdi letting us use rax for syscalls and letting us use the value in rax as an exit status

;we then exit
mov rax, 60 ;sys_exit
syscall

;we can use the command echo $? after the code runs to just print out our value