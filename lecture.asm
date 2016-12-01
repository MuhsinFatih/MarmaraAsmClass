TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc

/*
	signed  	unsigned
if (a1 < b1) or (b1 > 45)
	ax = ax + bx
	cx = cx - 1
else
	dx = dx + 2

*/

/*
	je  -> jump if equals
	jne -> jump if not equal

*/
.data


.code
cmp al, bl
jl iftrue
cmp bl, 45
jg iftrue
add dx, 2
jmp continue
iftrue:
add ax, cx
dec cx
continue:


main PROC

	
	;call DumpRegs

	exit
main ENDP
END main