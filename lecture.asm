TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc

/*

if ax == bx
	ax = ax + 1
	bx = bx - 1
else
	cx = cx + 1
	dx = 0

*/

/*
	je  -> jump if equals
	jne -> jump if not equal

*/


.data

cmp ax, bx
je iftrue

inc cs
mov dx, 0
jmp x

iftrue:
inc ax
dec bx

.code
main PROC

	
	;call DumpRegs

	exit
main ENDP
END main