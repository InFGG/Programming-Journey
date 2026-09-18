;this file explores the stack and ABI

;before we even run _start linux gives the program some memory and rsp is pointing at the top
;this makes programming easier as we dont have to manually allocate memory or mov rsp to specific addresses

;we can do push to add onto the top of the stack
;push 1 puts 1 ontop of the stack
;push 2 would then put 2 ontop of 1
;push 3 would then put 3 ontop of that 2

;we can then use pop to take from the top of the stack, it removes that from the stack completely so we can do;
;pop rax - this takes 3 off the top of the stack and put it into rax

;we can use this to write a basic program (commented out, this was a previous version but im keeping it for future use)

;section .text ;our code block
;global _start

;_start:
;push 1
;push 2
;push 3 ;putting 3 values onto the stack, literally stacking them ontop of eachother

;pop rax
;pop rbx
;pop rcx ;we take those 3 values off the stack and put them into the registers rax, rbx and rcx

;mov rdi, rax ;this copies the value from rax into rdi letting us use rax for syscalls and letting us use the value in rax as an exit status

;we then exit
;mov rax, 60 ;sys_exit
;syscall

;we can use the command echo $? after the code runs to just print out our value

;here is our full function demo:
section .text ;code block
global _start ;defining labels

_add2: ;here is our addition function
add rdi, rsi ;here is where we add rdi and rsi
mov rax, rdi ;we copy the result to rax (good practice) 
ret ;return to where the call was, this acts as a pop for the address by the call

_start: ;the code running on start
mov rdi, 2 ;putting 2 in rdi
mov rsi, 3 ;putting 3 in rsi
call _add2 ;putting this address on the stack and jumping to _add2:
add al, '0' ;converts the single digit 5 into ascii 5, THIS ONLY WORKS FOR SINGLE DIGITS, bad practice
push rax ;puts the ascii 5 on the stack
mov rsi, rsp ;puts the address of our ascii 5 into the write (remember it only needs the address NOT the data)
mov rax, 1 ;sys_write
mov rdi, 1 ;stdout
mov rdx, 1 ;prints 1 byte, this is all we need for this program, this doesnt scale well, look at 08 for a better practice
syscall

pop rsi ;fixing the stack

mov rax, 60 ;sys_exit
mov rdi, 0 ;exit status 0
syscall