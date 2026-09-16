;This file goes into some basic control flow

;An if statement checking if two values are equal and setting rax to 0 if they are
;setting up registers
mov rax, 5
mov rbx, 5
cmp rax, rbx ;doing the comparison
je .equal ;checking if they are equal and jumping to .equal if they are equal
jmp .end ;if they arent equal we just jump to the end
;these 2 could be replaced with a single jne .end but this way is better for expansion

.equal:
mov rax, 0 ;reseting rax to zero
jmp .end ;not needed but again good for future expansion

.end: ;end of the if statement and lets us skip past .equal if we are equal

;an if, else statement
;setting up registers
mov rax, 5
mov rbx, 5
cmp rax, rbx ;comparison
jg .greater ;if rax is greater than rbx then jump to .greater

add rax, rbx ;else add rbx to rax
jmp .end

.greater:
sub rax, rbx ;subtract rbx from rax if rax is greater

.end: ;end of statement

;doing a comparison and outputting a value based on it
;setting up registers
mov rax, 5
mov rbx, 5
mov rcx, 0 ;3rd register for an output without changing other registers
cmp rax, rbx
je .equal
jne .end

.equal:
mov rcx, 1

.end: