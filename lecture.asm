TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	; unsigned multiplication
	; mul x (r/m)

	; x -> 8 bit
	mul bl	; ax = bl * al

	; x -> 16 bit
	mul cx	; dx:ax = cx * ax

	mov bx, dx
	shl ebx, 16
	mov bx, ax

	; OR
	; easier, but slower since it requires reading and writing to memory
	push dx
	push ax
	pop ebx

	push dx,ax


	exit

main ENDP
END main