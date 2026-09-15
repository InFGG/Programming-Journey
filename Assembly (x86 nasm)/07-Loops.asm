;this file goes into loops, and how they work

;basic loop incrementing rax from 0 till it equals 10 (a while loop)
mov rax, 0 ;setup a register to 0
.loop1: ;set up a checkpoint
inc rax ;add 1 to rax
cmp rax, 10 ;compare rax to 10
jne .loop1 ;if rax is not equal to 10, then continue the loop
jmp .end1 ;if jne is not taken, we end the loop

.end1: ;checkpoint after the loop

;a precheck loop - the above loop is a postcheck loop because we check at the end of the loop, we check at the beginning here
mov rax, 0 ;setup a register to 0
.loop2: ;setup a checkpoint
cmp rax, 10 ;we make the comparison first because this allows us to skip the loop if we already meet the requirements or exceed them
jge .end2 ;if the rax is equal or greater 10 we end the loop before it begins (this is a signed comparison)
inc rax ;otherwise we increment rax by 1
jmp .loop2

.end2:

;a counter controlled loop - (a for loop)
mov rax, 0 ;the value we are modifying
mov rbx, 0 ;the counter
.loop3:
cmp rbx, 10 ;compare the counter to 10
je .end3 ;if the rbx equal to 10 we end the loop
inc rbx ;if je isnt taken we increment rbx by 1
add rax, 5 ;and we add 5 to rax
jmp .loop3 ;we jump back to the start of the loop

.end3: ;end of the loop