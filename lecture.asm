TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc



/*
	while (ax != bx) or (cx < 100)
		ax = ax - 1
		bx = bx + 1
		cx = cx * 2
		.
		.
*/

.data


.code

start:
	cmp ax, bx
	jne while
	jne while
	cmp cx, 100
	jnl _exit
while:
	dec ax
	inc bx
	add cx,cx ; lol. dont know multiplication yet
	jmp start

_exit:
	



main PROC

	
	;call DumpRegs

	exit
main ENDP
END main