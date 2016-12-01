TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc

/*
	signed  	unsigned
if (a1 < b1) and (b1 > 45)
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
jnl elsepart
cmp bl, 45
jng elsepart
add ax, bx
dec cx
jmp continue

elsepart:
ladd dx, 2

continue:


main PROC

	
	;call DumpRegs

	exit
main ENDP
END main