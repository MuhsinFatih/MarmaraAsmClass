TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	mov bx, ax	;bx = ax
	shl bx, 1	;bx = 2ax
	shl ax, 4	;ax = 16ax
	add ax, bx	;ax = 18ax




	exit

main ENDP
END main