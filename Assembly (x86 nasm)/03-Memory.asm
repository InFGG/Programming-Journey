;This file will be for memory operations and stuff

;writing to memory
mov rax, 0x1000 ;this stores a memory address in this register
mov [rax], 1 ;this now writes the value 1 into the memory location stored in rax, [rax] is used to signal a memory location otherwise we overwrite the address not the location

;copying from memory
mov rax, 0x1000 ;copying a memory address into rax
mov [rax], 1 ;putting 1 in that memory location

mov rbx, [rax] ;copies the data at the memory address stored in rax to rbx

;copying from one memory location to another
mov rax, 0x1000 ;copying an address into rax 
mov [rax], 1 ;copying a value into the address stored in rax
mov rbx, 0x1008 ;copying an address into rbx, this is our target address
mov rcx, [rax] ;this copies the contents of 0x1000 into rcx
mov [rbx], rcx ;this copies the value in rcx into the memory address stored in rbx
;we cannot just do mov [rbx], [rax] as x86 does not allow 2 memory operations in one instruction

;adding values stored in memory together
;setting up memory
mov rax, 0x1000
mov [rax], 1 
mov rbx, 0x1008
mov [rbx], 1 ;we do this to make sure theres a value here
;using a temp register to do the addition
mov rcx, [rax] ;copying to the temp register
add [rbx], rcx ;adding the contents of the temp register to the targeted memory address
