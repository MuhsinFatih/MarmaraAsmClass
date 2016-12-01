TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc



/*
	do
		.
		.
		ax = ax + 1
		bx = bx + 1
		cx = ax + bx
	while
		cx <= 100
*/

.data


.code

start:
	inc ax
	inc bx
	mov cx, ax
	add cx, bx

	cmp cx, 100
	jbe start

elsepart:
ladd dx, 2

continue:


main PROC

	
	;call DumpRegs

	exit
main ENDP
END main