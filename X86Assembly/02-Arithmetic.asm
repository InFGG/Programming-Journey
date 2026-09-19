; 1. Integer multiplication (5 * 5 = 25)
push 5
pop rax              ; 3 bytes (vs 7 bytes for 'mov rax, 5')
imul eax, eax        ; 3 bytes: squares eax into eax, avoids rbx entirely

; 2. Factorial (5! = 120)
push 5
pop rcx              ; rcx = 5 (counter)
push 1
pop rax              ; rax = 1 (product accumulator)
.fact:
imul eax, ecx        ; accumulator *= counter
loop .fact           ; 2 bytes: decrements rcx, loops until rcx == 0

; 3. Decrement & Increment
push 10
pop rax
dec eax              ; 10 -> 9
inc eax              ; 9 -> 10
