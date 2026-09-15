;This file goes into the cmp instruction and some basic control flow

;cmp explanation
mov rax, 5
mov rbx, 5
cmp rax, rbx ;internally it does a subtraction of rbx from rax, but doesnt store the result, instead it sets flags
je .example ;this flag can then be used by a jump to jump somewhere
;for example rax - rbx in this case is zero so the zero flag is set, this signals that theyre equal which triggers je (jump if equal) other examples are:
jmp .example ;no flags needed, will always jump to .example
jne .example ;will jump if the values are NOT equal
jg .example ;will jump if its greater than (it is a signed greater than)
jl .example ; will jump if its less than (signed less than)

;cmp itself doesnt mean signed or unsigned itself it depends on whats using it, examples of unsigned jumps:
ja .example ;unsigned greater than
jb .example ;unsigned less than