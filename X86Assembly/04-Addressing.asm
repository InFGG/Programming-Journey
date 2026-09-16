;this file covers memory addressing

;memory displacement
mov rax, 0x1000
mov rbx, [rax + 0x10] ;copies the data stored 16 bytes after the address stored in rax, this is in hexadecimal so its +16 bytes not +10 you can do it in decimal though: [rax + 10] +10 bytes

;base + index displacement
mov rax, 0x1000 ;we can say this is the address at the start of an array
mov rbx, 5 ;this is the array value we are accessing, the index
mov rcx, [rax + rbx] ;this accesses the value stored at memory address 0x1005

;Real arrays with a scale, base + index * scale
mov rax, 0x1000 ;array starting address (index 0)
mov rbx, 5 ;the array index we want to access
mov rcx, [rax + rbx * 8] ;this time we add an 8 as the scale, there are 4 allowed scales 1, 2, 4, and 8 bytes, this accesses address 0x1028

;for 64 bit arrays, they have an 8 byte scale, here are some examples of other arrays:

mov cl, [rax + rbx * 1] ;8 bit arrays are at the 1 byte scale
mov cx, [rax + rbx * 2] ;16 bit arrays are at 2 bytes
mov ecx, [rax + rbx * 4] ;32 bit arrays are at 4 bytes
mov rcx, [rax + rbx * 8] ;then we are back to 64 being at 8 bytes

;we can combine displacement with the [base + scale * index] to get [base + scale * index + displacement]
mov rax, 0x1000 ;array starting address
mov rbx, 5 ;the array index we want to access
mov rcx, [rax + rbx * 8 + 0x10] ;this effectively gives us the data at address 0x1038