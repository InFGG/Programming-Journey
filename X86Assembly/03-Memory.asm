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

;subtraction is mostly the same we just swap the add for a sub instead

;Swapping values in memory, there are 2 ways to do this, ill do both starting with this:
;setting up memory
mov rax, 0x1000
mov [rax], 0 
mov rbx, 0x1008
mov [rbx], 5
mov rcx, [rax] ;this copies the value stored at the memory address in rax to rcx
mov rdx, [rbx] ;this does the same with rbx and rdx
mov [rax], rdx ;this then copies the value that was originally from rbx into rax
mov [rbx], rcx ;this copies the value originally from rax into rbx

;the other way to do swapping values stored in memory:
;setting up memory
mov rax, 0x1000
mov [rax], 0 
mov rbx, 0x1008
mov [rbx], 5
mov rcx, [rax] ;this copies the value stored at the address in rax into rcx
xchg rcx, [rbx] ;the xchg instruction basically swaps values so we use it to swap the value in rcx with the value stored in the memory address stored in rbx
xchg rcx, [rax] ;this then swaps the value just grabbed from rbx into rax