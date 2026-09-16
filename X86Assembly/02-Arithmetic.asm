;this file will contain all of the arithmetic operations i have learned so far, (excluding addition and subtraction i put those two in basics)

;integer multiplication
mov rax, 5
mov rbx, 5 ;getting the registers setup
imul rax, rbx ;multiplies the values stored in rax and rbx and outputs into rax

;here is a basic use of imul to make a little factorial thing
;we can use 5! as an example:
mov rax, 1 ;the register we want to output to
mov rbx, 5 ;the number we are finding the factorial of this could be any number but for this example its 5
mov rcx, 0 ;a temporary counter register

.loop1: ;setting up the loop
add rcx, 1 ;incrementing the counter by 1
imul rax, rcx ;multiplying the output register by the counter
cmp rcx, rbx ;comparing the counter to end number of loops
jne .loop1 ;if its not equal to the counter it will loop again
jmp .done ;not needed for this specifically but useful for larger programs

.done:

;incremental decreasing
mov rax, 10 ;setting up registers
dec rax ;decreases the value stored in rax by 1

;incremental increasing
mov rax, 10
inc rax