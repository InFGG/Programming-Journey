;This file is basically just registers and basic arithmetic

;copying a number to a register
mov rax, 1 ;copies the integer 1 to the register rax

;copying a register to another register
mov rax, 0
mov rbx, 5 ;copies the values 0 and 5 to rax and rbx respectively
mov rax, rbx ;copies the value stored in rbx to rax

;adding to a register
mov rax, 0
add rax, 1 ;adds 1 to rax

;adding 2 registers
mov rax, 0
mov rbx, 5
add rax, rbx ;adds rbx to rax and stores it to rax

;skipping subtraction because it is the same thing as addition but using 'sub' instead of 'add'
;more complex arithmetic is in 02-Arithmetic