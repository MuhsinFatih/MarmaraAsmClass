TITLE Add and Subtract              (AddSub.asm)

; This program adds and subtracts 32-bit integers.
; Last update: 2/1/02

INCLUDE Irvine32.inc





.data


.code
main PROC

	; unsigned multiplication
	
	mov ax, 4000h
	mov bx, 20h

	mul bx	; dx:ax = ax * bx

	;had the result fitted ax, carry would have been 0. But in this example it overflows ax:
	; C: 1
	; O: 1

	exit

main ENDP
END main